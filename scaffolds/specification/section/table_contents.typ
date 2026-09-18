// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dimitri.julmy@hes-so.ch>
// Date   : 04 October 2024
// -------------------------------------------------------------------
// Table of Contents of the specifications (HEIA)
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values

// ---------- Table of Contents

// Primary Heading format in the table
#show outline.entry.where(level: 1): it => {
  v(16pt, weak: true)
  strong(it)
}

// Format the Table of Contents
#outline(
  depth: 2,
  indent: 2em,
)
