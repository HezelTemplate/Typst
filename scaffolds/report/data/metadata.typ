#import "@local/hezel-templates:0.1.0": gender, lang

// ---------- Metadata

#let metadata = (
  lang: lang.en,
  // Up to 5 logos (school(s), partner company...), rendered left to right,
  // each getting an equal share of the row's width. Filled in by
  // `script/new-project.sh` from `.env` (see `.env.example`), or add your
  // own files to asset/logos/ and list their filenames here.
  logos: (),
  type: "Report",
  scope: "Scope",
  name: "Project's name",
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
  year: "Year",
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

#let supervisors = (
  (firstname: "John", lastname: "Doe", gender: gender.m),
  (firstname: "Jane", lastname: "Doe", gender: gender.f),
)

#let experts = (
  (firstname: "John", lastname: "Doe", gender: gender.m),
  (firstname: "Jane", lastname: "Doe", gender: gender.f),
)

// Company/organization that mandated the project, if any — leave empty
// () if there is none, the cover page skips the section entirely.
#let mandants = ()

// ---------- Document versions (oldest to newest)

#let versions = (
  (
    version: "0.0",
    date: datetime.today(),
    changes: [Document creation],
  ),
)
