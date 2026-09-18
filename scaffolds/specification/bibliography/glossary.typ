// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dim.julmy@gmail.com>
// Date   : 20 May 2025
// -------------------------------------------------------------------
// Glossary chapter of the report
// -------------------------------------------------------------------

// ---------- Imports

// Third-party
#import "@preview/glossarium:0.5.6": (
  make-glossary, print-glossary, register-glossary,
)

// Values

// ---------- Terms of the glossary

#let glossary = (
  (
    key: "a",
    short: [],
    long: [],
    description: [],
    plural: [],
    longplural: [],
    group: [],
  ),
)

// ---------- Glossary table

#show: make-glossary
#register-glossary(glossary)

#set figure(placement: none)
#show figure: set block(width: 100%)
#show figure.caption: c => [
  #align(left, [#c.body])
]

#print-glossary(glossary)
