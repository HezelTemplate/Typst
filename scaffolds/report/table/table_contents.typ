/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/report/table/table_contents.typ
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

#import "@local/hezel-templates:0.1.0": chapter-header, linguify

// ---------- Table of Contents

// Same title treatment as the rest of the manually-inserted chapters
// (Revision History, Glossary...) rather than Typst's default outline
// title styling.
#chapter-header(linguify("table_content"))

#show outline.entry.where(level: 1): it => {
  v(16pt, weak: true)
  strong(it)
}

#outline(
  title: none,
  depth: 2,
  indent: 2em,
)
