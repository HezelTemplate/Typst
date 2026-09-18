// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dimitri.julmy@hes-so.ch>
// Date   : 04 Octover 2024
// -------------------------------------------------------------------
// Activities chapter of the specifications (HEIA)
// -------------------------------------------------------------------

// ---------- Imports

// Third-party

// Values
#import "../data/styling.typ": colors
#import "../data/tasks_group.typ": tasksgroups
#import "../data/metadata.typ": project
#import "../data/tasks.typ": tasks

// ---------- Time repartition

== Phases du projet

En accord avec l'objectif et les suggestions du mandant, les phases/groupement de tâches suivants sont posées.

// Apply styling to the header
#show table.cell.where(y: 0): set text(
  weight: "medium",
  size: 13pt,
  fill: white,
)

// Apply styling to the frame
#let frame(stroke) = (x, y) => (
  left: if calc.odd(x) { 1pt },
  right: if x == 1 { 1pt },
  top: if y == 3 { 1pt },
  bottom: if y == 2 { 1pt },
)

#for tg in tasksgroups {
  block(
    breakable: false,
    grid(
      rows: 3,
      columns: 100%,

      // Activity name
      grid.cell(
        y: 0,
        fill: colors.c3,
        inset: 7pt,
        text(
          size: 14pt,
          weight: "medium",
          fill: white,
          tg.name,
        ),
      ),

      // Activity description
      grid.cell(
        y: 1,
        inset: 7pt,
        tg.desc,
      ),

      grid.cell(
        y: 2,
        inset: 7pt,
        [*Délivrable* : #tg.deliverable],
      )
    ),
  )
}

== Répartition du temps

Ce #lower(project.scope) possède un poids de #project.credits crédits (1 crédit équivaut à #project.hours_per_credit heures de travail) étalé sur #project.duration semaines. En plus de la réunion hebdomadaire d'environ 30 minutes entre les différents acteurs du projet, le temps moyen par semaine alloué au projet est de #{ calc.floor(project.credits * project.hours_per_credit / project.duration) } heures. La répartition suivante du temps est proposée :

// Apply styling to the header
#show table.cell.where(y: 0): set text(
  weight: "medium",
  size: 13pt,
  fill: white,
)

// Apply styling to the frame
#let frame(stroke) = (x, y) => (
  left: if x == 0 { 0pt } else { 1pt },
  right: if x == 0 { 1pt } else { 0pt },
  top: if y == 0 or y == 1 { 2pt },
  bottom: if y == 0 { 2pt } else if y == tasksgroups.len() + 1 { 0pt } else {
    1pt
  },
)

// Display versions data
#let crt_hours = 0
#let total_hours = 0
#table(
  columns: (70%, 30%),
  inset: 8pt,
  fill: (_, y) => if y == 0 { colors.c3 } else if y == tasksgroups.len() + 1 {
    colors.c4
  },
  stroke: frame(colors.c1),
  align: (x, y) => if x == 0 and y != tasksgroups.len() + 1 {
    horizon
  } else if x == 1 { horizon + center } else if x == 0
    and y == tasksgroups.len() + 1 { right },
  table.header[Phases][Heures allouées],
  ..for (name, key) in tasksgroups {
    {
      for t in tasks {
        if key == t.related_group { crt_hours = crt_hours + t.estimated_time }
      }
    }
    (name, str(crt_hours))
    {
      total_hours = total_hours + crt_hours
      crt_hours = 0
    }
  },
  [*Total*], [*#str(total_hours)*],
)


// ---------- Activities

== Tâches

// Apply styling to the frame
#let frame(stroke) = (x, y) => (
  left: if calc.odd(x) { 1pt },
  right: if x == 1 { 1pt },
  top: if y == 3 { 1pt },
  bottom: if y == 2 { 1pt },
)

#for t in tasks {
  block(
    breakable: false,
    grid(
      rows: 3,
      columns: (16%, 16%, 20%, 48%),
      stroke: frame(colors.c1),
      align: (x, y) => if (y == 2 or y == 3) and x != 3 { center } else {
        left
      },

      // Activity name
      grid.cell(
        y: 0,
        colspan: 4,
        fill: colors.c3,
        inset: 7pt,
        text(
          size: 14pt,
          weight: "medium",
          fill: white,
          t.name,
        ),
      ),

      // Activity description
      grid.cell(
        y: 1,
        colspan: 4,
        inset: 7pt,
        t.desc,
      ),

      // Activity details headers
      ..(
        [*Date de début*],
        [*Date de fin*],
        [*Temps estimé [h]*],
        [*Phase associé*],
      ).map(grid.cell.with(y: 2, inset: 7pt)),
      // Activity details contents
      ..(
        [#t.date_start.display()],
        [#t.date_end.display()],
        [#t.estimated_time],
        [#for g in tasksgroups { if g.key == t.related_group { g.name } }],
      ).map(grid.cell.with(y: 3, inset: 7pt)),
    ),
  )
}
