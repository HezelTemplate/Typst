// -------------------------------------------------------------------
// Copyright © 2025 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dim.julmy@gmail.com>
// Date   : 20 May 2025
// -------------------------------------------------------------------
// Planning chapter of the report
// -------------------------------------------------------------------

// ---------- Imports

// Third-party
#import "@preview/timeliney:0.4.0"

// Values
#import "../data/styling.typ": colors
#import "../data/tasks_group.typ": tasksgroups
#import "../data/milestones.typ": milestones
#import "../data/tasks.typ": tasks

// ---------- Planning

// Landscape orientation
#set page(flipped: true)

// Special margin for the planning (x : for both left and right)
#set page(margin: (top: 0.6cm, bottom: 0.6cm, x: 0.5cm))

= Planning

// Gantt diagram
#timeliney.timeline(
  spacing: 2.5pt,
  grid-style: (
    stroke: (
      dash: "dashed",
      thickness: 0.4pt,
      paint: colors.c1,
    ),
  ),
  show-grid: true,
  {
    import timeliney: *

    headerline(group(([*2024*], 14)), group(([*2025*], 5)))
    headerline(
      group(..range(14).map(n => strong("A" + str(n + 1)))),
      group(..range(5).map(n => strong("A" + str(n + 15)))),
    )

    // Display tasksgroups and related tasks
    for tg in tasksgroups {
      taskgroup(title: [*#tg.name*], {
        for t in tasks {
          if tg.key == t.related_group {
            task(t.name, (t.from, t.to), style: (stroke: 2pt + gray))
          }
        }
      })
    }

    // Display milestone
    for m in milestones {
      milestone(
        at: m.at,
        style: (stroke: (dash: "dashed")),
        align(center, [
          #m.name
        ]),
      )
    }
  },
)
