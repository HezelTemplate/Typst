/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/report/bibliography/glossary.typ
 * Project: /home/hezeltm/Projects/typst_template/report/bibliography
 * Created Date: Monday, November 17th 2025, 6:53:51 pm
 * Author: Dimitri Julmy, dev@dimitri-julmy.com
 * --------------------------------------------------------------------------------
 * Last Modified: Thu Dec 18 2025
 * Modified By: Dimitri Julmy
 * --------------------------------------------------------------------------------
 * Copyright (c) 2025 Dimitri Julmy
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * --------------------------------------------------------------------------------
 */


// ---------- Imports

#import "@preview/glossarium:0.5.6": (
  make-glossary, print-glossary, register-glossary,
)

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
