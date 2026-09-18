// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dimitri.julmy@hes-so.ch>
// Date   : 04 October 2024
// -------------------------------------------------------------------
// Table of Versions of the specifications (HEIA)
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values

// ---------- Imports

// Values
#import "../data/metadata.typ": versions
#import "../data/styling.typ": colors

// ---------- Table of Versions

// Apply styling to the header
#show table.cell.where(y: 0): set text(
  weight: "medium",
  size: 13pt,
  fill: white,
)

// Apply styling to the frame
#let frame(stroke) = (x, y) => (
  left: if x == 1 { 1pt },
  right: if x == 1 { 1pt },
  top: if y == 0 or y == 1 { 2pt },
  bottom: if y == 0 { 2pt } else if y == versions.len() { 0pt } else { 1pt },
)

// Display versions data
#table(
  columns: (15%, 15%, 70%),
  align: (x, y) => if x == 0 { center + horizon } else if x == 1 {
    horizon + center
  } else if x == 2 { horizon },
  inset: 8pt,
  fill: (_, y) => if y == 0 { colors.c3 },
  stroke: frame(colors.c1),
  table.header[Version][Date][Modification.s],
  ..for (version, date, changes) in versions {
    (version, date.display(), changes)
  },
)
