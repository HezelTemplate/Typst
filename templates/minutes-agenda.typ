#import "../common/colors.typ": colors
#import "../common/logos.typ": logo-row
#import "@preview/linguify:0.5.0": linguify, set-database

#let minutes-agenda(agenda: (:), actors: (), goals: (), logos: (), body) = {
  set text(region: "ch", lang: agenda.lang, font: "Times New Roman")
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

  [= #linguify("meeting_agenda_of") #agenda.seance_date.display()]

  [== #agenda.project_scope]

  text(size: 15pt, weight: "medium", fill: colors.c1)[#agenda.project_name]

  [== #linguify("meeting_details")]

  show table.cell.where(x: 0): set text(size: 12pt, fill: white)
  set table(fill: (x, _) => if x == 0 { colors.c3 })

  table(
    columns: (22%, 78%),
    align: horizon,
    [*#linguify("location")*],
    [#agenda.location_name – #agenda.location_street – #agenda.location_npa #agenda.location_locality],

    [*#linguify("room")*], [#agenda.location_room],
    [*#linguify("date")*], [#agenda.seance_date.display()],
    [*#linguify("schedule")*], [#agenda.schedule],
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

  [== #linguify("session_goals")]

  show table.cell.where(x: 0): set text(size: 11pt, fill: black)
  show table.cell.where(y: 0): set text(size: 12pt, fill: white)
  set table(fill: (_, y) => if y == 0 { colors.c3 }, align: left + horizon)

  table(
    columns: (20%, 80%),
    table.header[*#linguify("duration_min")*][*#linguify("objectives")*],
    ..for goal in goals { (str(goal.duration), goal.desc) },
  )

  body
}
