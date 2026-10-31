# Typst Templates

## Requirements

- [Typst](https://typst.app) CLI
- The **Times New Roman** font installed on the system (used by every
  template, Typst silently falls back to another font if it is missing)
- Internet access on the first compilation on a machine, to download the
  `@preview/linguify` package (cached afterwards)

## Quick start

1. (Optional) Set up your personal profile.

   ```sh
   cp .env.example .env
   $EDITOR .env
   ```

   Values from `.env` (language, author, institution, programme, logos) replace the
   `%%...%%` placeholders of every new document. Without a `.env`, the
   placeholders are left as-is for you to fill in by hand.

2. Scaffold a new document.

   ```sh
   ./script/new-project.sh <document_type> ~/path/to/my/new/document
   ```

   The document is compiled once right away, to `main.pdf`.

3. Fill in your metadata.

   | Template | Data file |
   |---|---|
   | `report`, `practicalWork`, `specification` | `data/metadata.typ` |
   | `minutesMeeting` | `data/minute_data.typ` |
   | `minutesAgenda` | `data/agenda_data.typ` |

4. Compile.

   ```sh
   typst compile ~/path/to/my/new/document/main.typ
   ```

Each new document is self-contained: `new-project.sh` copies the package
source into `<dest>/lib/hezel-templates/` and rewrites the imports to point
at it, so the document compiles on any machine without installing anything.
Changes made to the package afterwards don't propagate to existing documents.

## Available templates

| Template | Command | Use case |
|---|---|---|
| `report` | `./script/new-project.sh report <dest>` | Full academic/project report |
| `practicalWork` | `./script/new-project.sh practicalWork <dest>` | Simplified practical work report |
| `minutesMeeting` | `./script/new-project.sh minutesMeeting <dest>` | Meeting minutes (PV) |
| `minutesAgenda` | `./script/new-project.sh minutesAgenda <dest>` | Meeting agenda |
| `specification` | `./script/new-project.sh specification <dest>` | Project specification |

## Package API

In a document created with `new-project.sh`, import from the bundled copy:

```typst
#import "/lib/hezel-templates/lib.typ": <name>
```

The scaffolds in this repo import the installed package instead
(`#import "@local/hezel-templates:0.1.0": <name>`), see
[Working on the templates](#working-on-the-templates).

Exported names (see [lib.typ](lib.typ)):

| Name | What it is |
|---|---|
| `report`, `practical-work`, `specification`, `minutes-meeting`, `minutes-agenda` | Document templates (`#show: report.with(...)`) |
| `chapter-header` | Unnumbered chapter title styled like a level-1 heading |
| `colors` | Shared color palette |
| `logo-row` | Row of logos, as rendered on cover pages |
| `gender`, `lang`, `title` | Helpers from [common/utils.typ](common/utils.typ) |
| `linguify` | Re-export of `@preview/linguify`, for translated labels |

## Working on the templates

Package source lives in [lib.typ](lib.typ), [common/](common/) and
[templates/](templates/); [scaffolds/](scaffolds/) holds the starting point
of each document type.

- `./script/install.sh` installs the package to
  `~/.local/share/typst/packages/local/`. Re-run it after modifying the
  package source, to compile or preview the scaffolds in place.
- `./script/test.sh` reinstalls the package and checks that every scaffold
  still compiles.
- `./script/bump-version.sh <new-version> [search-root]` bumps the version in
  `typst.toml` and in the scaffolds' imports, offers to bump other projects
  under `search-root` that still import the old version, then reinstalls and
  runs the tests. Documents created with `new-project.sh` are unaffected,
  since they carry their own copy of the package.
