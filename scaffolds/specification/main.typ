#import "@local/hezel-templates:0.1.0": linguify, specification
#import "./data/metadata.typ": (
  authors, entity, experts, logos, mandants, project, report, supervisors,
  versions,
)

#show: specification.with(
  report: report,
  lang: report.lang,
  project: project,
  entity: entity,
  authors: authors,
  supervisors: supervisors,
  mandants: mandants,
  experts: experts,
  versions: versions,
  logos: logos.map(f => image("assets/" + f, width: 100%)),
)

// ---------- Table des versions

= #linguify("table_versions") <table_versions>
#include "section/table_versions.typ"

// ---------- Table des matières

#pagebreak()
#include "section/table_contents.typ"

// ---------- Glossaire

#pagebreak()
= #linguify("glossary") <glossary>
#include "bibliography/glossary.typ"

// ---------- Contexte

#pagebreak()
= #linguify("context") <context>
#include "section/context.typ"

// ---------- Objectifs

#pagebreak()
= #linguify("goals") <goals>
#include "section/goals.typ"

// ---------- Activités

#pagebreak()
= #linguify("activities") <activities>
#include "section/activities.typ"

// ---------- Planning

#pagebreak()
#include "section/planning.typ"

// ---------- Table des références

#pagebreak()
= #linguify("table_references") <table_references>
#include "section/table_references.typ"

// ---------- Table des illustrations

#pagebreak()
= #linguify("table_illustrations") <table_illustations>
#include "section/table_illustrations.typ"
