// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dimitri.julmy@hes-so.ch>
// Date   : 04 October 2024
// -------------------------------------------------------------------
// Table of Illustrations of the specifications (HEIA)
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../data/styling.typ": colors

// ---------- Table of Illustrations

// Primary Heading format in the table
#show outline.entry.where(level: 1): it => {
  v(10pt, weak: true)
  text(
    size: 13pt,
    weight: "semibold",
    it,
  )
}

#outline(
  title: none,
  target: figure.where(kind: image),
)
