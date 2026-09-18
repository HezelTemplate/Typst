// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dim.julmy@gmail.com>
// Date   : 18 May 2025
// -------------------------------------------------------------------
// Metadata of the specifications
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values

// ---------- Logos

// Up to 5 logos (school(s), partner company...), rendered left to right,
// each getting an equal share of the row's width. Filled in by
// `script/new-project.sh` from `.env` (see `.env.example`), or add your
// own file to assets/ and list its filename here.
#let logos = ()

// ---------- Report

#let report = (
  name: [Cahier des charges],
  date_creation: datetime(year: 2024, month: 09, day: 22),
  date_due: datetime.today(),
)

// ---------- Project

#let project = (
  scope: [Projet de semestre/bachelor / Autre],
  name: [Titre du projet],
  git_url: "https://example.com/",
  duration: 18, // weeks
  credits: 4,
  hours_per_credit: 30,
)

// ---------- Entity

#let entity = (
  name: [%%ENTITY_NAME%%],
  acronym: [%%ENTITY_ACRONYM%%],
  sector: [Filière],
  orientation: [Orientation],
  locality: [%%ENTITY_LOCALITY%%],
  year: [Année],
)

// ---------- Author.s

#let authors = (
  (
    firstname: [%%AUTHOR_FIRSTNAME%%],
    lastname: [%%AUTHOR_LASTNAME%%],
    gender: [%%AUTHOR_GENDER%%],
    title: [],
  ),
)

// ---------- Supervisor.s

#let supervisors = (
  (
    firstname: [],
    lastname: [],
    gender: [],
    title: [],
  ),
)

// ---------- Mandant.s

#let mandants = (
  (
    firstname: [],
    lastname: [],
    gender: [],
    title: [],
    society: [],
    url: "",
  ),
)

// ---------- Experts.s

#let experts = (
  (
    firstname: [],
    lastname: [],
    gender: [],
    title: [],
  ),
)

// ---------- Document version (from the oldest to the newest)

#let versions = (
  (
    version: "0.0",
    date: datetime.today(),
    changes: [Création du document],
  ),
)
