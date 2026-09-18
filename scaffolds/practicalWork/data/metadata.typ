/*
 * --------------------------------------------------------------------------------
 * File: /home/hezeltm/Projects/typst_template/practical_work/data/metadata.typ
 * Project: /home/hezeltm/Projects/typst_template/practical_work/data
 * Created Date: Friday, December 19th 2025, 8:47:21 am
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



// ---------- Metadata

#let metadata = (
  lang: "en",
  // Up to 5 logos (school(s), partner company...), rendered left to right,
  // each getting an equal share of the row's width. Filled in by
  // `script/new-project.sh` from `.env` (see `.env.example`), or add your
  // own files to asset/logos/ and list their filenames here.
  logos: (),
  type: "Report",
  scope: "Scope",
  name: "Practical Work Name",
  course: "Course Name",
  git_url: "https://gitlab-url.com",
  date_creation: datetime.today(),
  date_due: datetime.today(),
  entity: "%%ENTITY_NAME%%",
  entity_acronym: "%%ENTITY_ACRONYM%%",
  section: "%%SECTION_NAME%%",
  section_acronym: "%%SECTION_ACRONYM%%",
  profil: "%%PROFILE_NAME%%",
  profil_acronym: "%%PROFILE_ACRONYM%%",
  locality: "%%ENTITY_LOCALITY%%",
)

// ---------- Persons

#let authors = (
  (
    firstname: "%%AUTHOR_FIRSTNAME%%",
    lastname: "%%AUTHOR_LASTNAME%%",
    gender: "%%AUTHOR_GENDER%%",
    locality: "%%AUTHOR_LOCALITY%%",
  ),
)
