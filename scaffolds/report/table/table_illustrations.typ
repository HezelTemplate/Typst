/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/report/table/table_illustrations.typ
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
