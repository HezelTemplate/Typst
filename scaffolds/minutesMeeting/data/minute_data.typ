/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/minutes_meeting/data/minute_data.typ
 * Project: /home/hezeltm/Projects/typst_template/minutes_meeting/data
 * Created Date: Tuesday, November 18th 2025, 7:51:03 pm
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


// ---------- Agenda data

#let minute = (
  lang: "en",
  // Up to 5 logos (school(s), partner company...), rendered left to right,
  // each getting an equal share of the row's width. Filled in by
  // `script/new-project.sh` from `.env` (see `.env.example`), or add your
  // own files to asset/ and list their filenames here.
  logos: (),
  project_scope: [Project scope],
  project_name: [Project name],
  seance_date: datetime(year: 2025, month: 12, day: 18),
  location_name: "Location name",
  location_street: "Street 1",
  location_locality: "Locality name",
  location_npa: "3333",
  location_room: "Room 101",
  schedule: "09:30 - 10:20",
)

// ---------- Actors

#let actors = (
  (
    firstname: "%%AUTHOR_FIRSTNAME%%",
    lastname: "%%AUTHOR_LASTNAME%%",
    gender: "%%AUTHOR_GENDER%%",
    isChairman: true,
    isScribe: true,
    excused: false,
  ),
  (
    firstname: "John",
    lastname: "Doe",
    gender: "m",
    isChairman: false,
    isScribe: false,
    excused: false,
  ),
)

#let talks = (
  (
    name: [TODO 1],
    desc: [-],
    decision: [-],
    duration: 10,
  ),
  (
    name: [TODO 2],
    desc: [-],
    decision: [-],
    duration: 10,
  ),
  (
    name: [TODO 3],
    desc: [-],
    decision: [-],
    duration: 10,
  ),
)

#let tasks = (
  (
    name: [-],
    desc: [-],
    date_due: datetime(year: 2025, month: 12, day: 18),
    exec: [%%AUTHOR_FIRSTNAME%% %%AUTHOR_LASTNAME%%],
  ),
)
