#!/usr/bin/env bash
set -e

TEMPLATES=(report practicalWork minutesMeeting minutesAgenda specification)
TEMPLATE="${1:-}"
DEST="${2:-}"

usage() {
  echo "Usage: $0 <template> <destination>"
  echo ""
  echo "Available templates:"
  for t in "${TEMPLATES[@]}"; do echo "  $t"; done
  exit 1
}

[[ -z "$TEMPLATE" || -z "$DEST" ]] && usage

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO_DIR/scaffolds/$TEMPLATE"

if [ ! -d "$SRC" ]; then
  echo "Unknown template: $TEMPLATE"
  usage
fi

if [ -e "$DEST" ]; then
  echo "Destination already exists: $DEST"
  exit 1
fi

cp -rL "$SRC" "$DEST"

# Remove compiled output from the copy
find "$DEST" -name "*.pdf" -delete

# Data file (relative to $DEST) and logo asset dir per template — scaffolds
# ship generic, with %%VAR%% placeholders for the personal bits. (Not the
# shell-style ${VAR}: Typst's `[...]` content mode treats a leading `$` as
# math mode, which would break scaffolds using content blocks.)
case "$TEMPLATE" in
report | practicalWork)
  DATA_FILE="data/metadata.typ"
  ASSET_DIR="asset/logos"
  ;;
minutesMeeting)
  DATA_FILE="data/minute_data.typ"
  ASSET_DIR="asset"
  ;;
minutesAgenda)
  DATA_FILE="data/agenda_data.typ"
  ASSET_DIR="asset"
  ;;
specification)
  DATA_FILE="data/metadata.typ"
  ASSET_DIR="assets"
  ;;
esac

# Escapes a replacement value for sed's `s///` (backslash, ampersand and
# the `/` delimiter itself).
sed_escape() {
  printf '%s' "$1" | sed -e 's/[\/&]/\\&/g'
}

apply_profile() {
  local env_file="$REPO_DIR/.env"
  if [ ! -f "$env_file" ]; then
    echo "No .env found (see .env.example) — left %%...%% placeholders in $DATA_FILE."
    return
  fi

  set -a
  # shellcheck disable=SC1090
  source "$env_file"
  set +a

  # Copy personal logos into the new project and build the Typst tuple.
  local logos_tuple=""
  if [ -n "${LOGO_PATHS:-}" ]; then
    mkdir -p "$DEST/$ASSET_DIR"
    for path in $LOGO_PATHS; do
      # Relative paths in .env are relative to the repo root, not to
      # wherever new-project.sh happens to be invoked from.
      case "$path" in
      /*) ;;
      *) path="$REPO_DIR/$path" ;;
      esac
      if [ ! -f "$path" ]; then
        echo "Logo not found, skipping: $path"
        continue
      fi
      cp "$path" "$DEST/$ASSET_DIR/"
      logos_tuple+="\"$(basename "$path")\", "
    done
    logos_tuple="${logos_tuple%, }"
  fi

  local sed_args=()
  for name in AUTHOR_FIRSTNAME AUTHOR_LASTNAME AUTHOR_GENDER AUTHOR_LOCALITY \
    ENTITY_NAME ENTITY_ACRONYM ENTITY_LOCALITY \
    SECTION_NAME SECTION_ACRONYM PROFILE_NAME PROFILE_ACRONYM; do
    sed_args+=(-e "s/%%${name}%%/$(sed_escape "${!name:-}")/g")
  done
  # `logos: ()` / `logos = ()` is bare Typst code (not a string), so it
  # can't carry a %%TOKEN%% placeholder of its own — instead, when there
  # are logos to add, target that literal empty tuple directly.
  if [ -n "$logos_tuple" ]; then
    local logos_escaped
    logos_escaped="$(sed_escape "$logos_tuple")"
    sed_args+=(-e "s/logos: (),/logos: (${logos_escaped}),/")
    sed_args+=(-e "s/logos = ()/logos = (${logos_escaped})/")
  fi

  local tmp
  tmp="$(mktemp)"
  sed "${sed_args[@]}" "$DEST/$DATA_FILE" >"$tmp" && mv "$tmp" "$DEST/$DATA_FILE"
  echo "Applied your profile from .env to $DATA_FILE"
}

apply_profile

echo "Created new '$TEMPLATE' project at $DEST"
echo ""
echo "Next steps:"
echo "  1. Edit $DEST/$DATA_FILE"
echo "  2. Add any remaining logos to $DEST/$ASSET_DIR/"
echo "  3. Run: typst compile $DEST/main.typ"
echo ""
echo "Compiling..."
typst compile "$DEST/main.typ"
echo "Done: $DEST/main.pdf"
