// -------------------------------------------------------------------
// Copyright © 2024 Dimitri Julmy
// License GPL-2.0-or-later
// -------------------------------------------------------------------
// Author : Dimitri Julmy <dimitri.julmy@hes-so.ch>
// Date   : 04 October 2024
// -------------------------------------------------------------------
// Tasks data of the specifications (HEIA)
// -------------------------------------------------------------------

// ---------- Imports

// Third-party
#import "@preview/glossarium:0.4.1": gls

// Values
#import "./metadata.typ": project

// ---------- Tasks

#let hours_per_weeks = calc.floor(
  project.credits * project.hours_per_credit / project.duration,
)

#let tasks = (
  (
    name: [Tâche 1],
    desc: [#lorem(50)],
    date_start: datetime(year: 2024, month: 09, day: 16),
    date_end: datetime(year: 2024, month: 09, day: 16),
    from: 0,
    to: 9,
    estimated_time: calc.floor((9 - 0) * hours_per_weeks),
    related_group: 1,
  ),
  (
    name: [Tâche 2],
    desc: [#lorem(50)],
    date_start: datetime(year: 2024, month: 09, day: 16),
    date_end: datetime(year: 2024, month: 09, day: 18),
    from: 9,
    to: 19,
    estimated_time: calc.floor((19 - 9) * hours_per_weeks),
    related_group: 2,
  ),
)
