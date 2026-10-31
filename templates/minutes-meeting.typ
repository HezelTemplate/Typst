#import "../common/colors.typ": colors
#import "../common/logos.typ": logo-row
#import "@preview/linguify:0.5.0": linguify, set-database

#let minutes-meeting(
  minute: (:),
  actors: (),
  talks: (),
  tasks: (),
  logos: (),
  body,
) = {
  set text(region: "ch", lang: minute.lang, font: "Times New Roman")
  set page(margin: (top: 3cm, bottom: 3cm, x: 1.5cm))
  if logos.len() > 0 {
    set page(header: logo-row(logos))
  }
  show link: set text(fill: blue.darken(60%))
  set page(numbering: "1/1")
  set list(indent: 5pt, spacing: 0.8em, body-indent: 0.4em, marker: (
    [•],
    [◦],
    [⁃],
  ))

  set-database(toml("../common/lang.toml"))

  show heading: it => {
    if it.level == 1 [
      #set align(center)
      #set text(size: 27pt, weight: "extrabold", fill: white)
      #block(fill: colors.c1, width: 100%, inset: 18pt, it.body)
    ] else if it.level == 2 [
      #set align(left)
      #set text(size: 20pt, weight: "bold", fill: white)
      #block(fill: colors.c2, width: 100%, inset: 10pt, it.body)
    ]
  }

  // Extract chairman and scribe
  let scribe = ""
  let chairman = ""
  for a in actors {
    if a.isChairman { chairman = a.lastname + " " + a.firstname }
    if a.isScribe { scribe = a.lastname + " " + a.firstname }
    if chairman != "" and scribe != "" { break }
  }

  // ---- Content ----

  [= #linguify("meeting_minutes_of") #minute.seance_date.display()]

  [== #minute.project_scope]

  text(size: 15pt, weight: "medium", fill: colors.c1)[#minute.project_name]

  [== #linguify("meeting_details")]

  show table.cell.where(x: 0): set text(size: 12pt, fill: white)
  set table(fill: (x, _) => if x == 0 { colors.c3 })

  table(
    columns: (22%, 78%),
    align: horizon,
    [*#linguify("location")*],
    [#minute.location_name – #minute.location_street – #minute.location_npa #minute.location_locality],

    [*#linguify("room")*], [#minute.location_room],
    [*#linguify("date")*],
    [#minute.seance_date.display("[day].[month].[year]")],

    [*#linguify("schedule")*], [#minute.schedule],
  )

  table(
    columns: (22%, 78%),
    align: horizon,
    [*#linguify("meeting_chair")*], [#chairman],
    [*#linguify("minute_taker")*], [#scribe],
    [*#linguify("expected_participants")*],
    [
      #for a in actors {
        if not a.excused {
          if a == actors.first() { a.lastname + " " + a.firstname } else {
            ", " + a.lastname + " " + a.firstname
          }
        }
      }
    ],

    [*#linguify("excused")*],
    [
      #for a in actors {
        if a.excused {
          a.lastname + " " + a.firstname
          if a != actors.last() { ", " }
        }
      }
    ],
  )

  [== #linguify("agenda")]

  show table.cell.where(x: 0): set text(size: 11pt, fill: black)
  show table.cell.where(y: 0): set text(size: 12pt, fill: white)
  set table(fill: (_, y) => if y == 0 { colors.c3 })

  table(
    columns: (20%, 80%),
    table.header[*#linguify("duration_min")*][*#linguify("objective_s")*],
    ..for t-item in talks { (str(t-item.duration), t-item.name) },
  )

  pagebreak()
  [== #linguify("discussions")]

  for talk in talks {
    block(
      breakable: false,
      grid(
        rows: 3,
        columns: 100%,
        grid.cell(y: 0, fill: colors.c3, inset: 7pt, text(
          size: 12pt,
          weight: "bold",
          fill: white,
          talk.name,
        )),
        grid.cell(y: 1, inset: 7pt, talk.desc),
        grid.cell(
          y: 2,
          inset: 7pt,
          [*#linguify("decision_taken")* : #talk.decision],
        ),
      ),
    )
  }

  [== #linguify("key_points")]

  table(
    columns: (40%, 60%),
    align: horizon,
    table.header[*#linguify("objective_s")*][*#linguify("decision_s")*],
    ..for talk in talks { (talk.name, talk.decision) },
  )

  table(
    columns: (26%, 50%, 12%, 12%),
    align: (x, _) => if x == 0 or x == 1 { horizon } else { horizon + center },
    table.header[*#linguify("tasks")*][*#linguify("description")*][*#linguify("assignee")*][*#linguify("due_date")*],
    ..for task in tasks {
      (
        task.name,
        task.desc,
        task.exec,
        task.date_due.display("[day].[month].[year]"),
      )
    },
  )

  body
}
