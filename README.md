# Typst Templates

## Quick start

1. Install the package once.

   ```sh
   ./script/install.sh
   ```

2. Scaffold a new document

   ```sh
   ./script/new-project.sh <document_type> ~/path/to/my/new/document
   ```

3. Fill in your metadata.

   ```sh
   # open the file in your editor
   $EDITOR ~/path/to/my/new/document/data/metadata.typ
   ```

4. Compile

   ```sh
   typst compile ~/path/to/my/new/document/main.typ
   ```

Each new document is self-contained: `new-project.sh` copies the package
source into `<dest>/lib/hezel-templates/` and rewrites the imports to point
at it, so the document compiles on any machine without installing anything.
Changes made to the package afterwards don't propagate to existing documents.

Re-run `./script/install.sh` whenever you modify the package source.
Run `./script/test.sh` to verify all templates still compile after a change.
TODO bump-version.sh

## Available templates

| Template | Command | Use case |
|---|---|---|
| `report` | `./script/new-project.sh report <dest>` | Full academic/project report |
| `practicalWork` | `./script/new-project.sh practicalWork <dest>` | Simplified practical work report |
| `minutesMeeting` | `./script/new-project.sh minutesMeeting <dest>` | Meeting minutes (PV) |
| `minutesAgenda` | `./script/new-project.sh minutesAgenda <dest>` | Meeting agenda |
| `specification` | `./script/new-project.sh specification <dest>` | Project specification |

## Package API

Import anything from the package using:

```typst
#import "@local/hezel-templates:0.1.0": <name>
```
