/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/report/table/table_versions.typ
 * Project: /home/hezeltm/Projects/typst_template/report/table
 * Created Date: Monday, November 17th 2025, 6:53:51 pm
 * Author: Dimitri Julmy, dev@dimitri-julmy.com
 * --------------------------------------------------------------------------------
 * Last Modified: Fri Dec 19 2025
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

#import "../data/metadata.typ": versions

// ---------- Table of Versions

// Conventional table: just one thin rule under the header, no vertical
// rules, no fill, no top/bottom border.
#table(
  columns: (15%, 15%, 70%),
  align: (x, y) => if x == 2 { horizon } else { center + horizon },
  inset: 8pt,
  stroke: none,
  table.header(
    text(weight: "bold")[Version],
    text(weight: "bold")[Date],
    text(weight: "bold")[Modification],
  ),
  table.hline(stroke: 0.6pt + black),
  ..for (version, date, changes) in versions {
    (version, date.display(), changes)
  },
)
