# Binding table of the plates of Architecture Publisher 0.14.0

Step 1(c) of the roadmap (`docs/roadmap.md`, "Binding table details" and "Step 1(c)"). Written 2026-11-14, read-only
on everything else.

Subject: the review set built by 0.14.0 at
`architecture-publications/build/review/2026-11-14-archpub-0.14.0/default/<work>-zh/` for six works (aigw-client,
architecture-publisher, ddwg, `ethos`, filmkit, openai-responses-proxy), and the drawing code of the working tree of
`architecture-publisher` (`git describe`: v0.14.0-5-g0499684e; `git diff --stat v0.14.0` over `src/poster`,
`src/house.json`, `src/overview`, `src/edition`, `src/locale.mjs`, `docs/reference` shows one changed file,
`docs/reference/configuration.md`, so the drawing code equals the tag).

File abbreviations: `fig` = `src/poster/figure.mjs`, `strip` = `src/poster/strip.mjs`, `tok` =
`src/poster/tokens.mjs`, `plate` = `src/poster/plate.mjs`, `plates` = `src/poster/compose/plates.mjs`, `typ` =
`src/overview/house.typ`, `house` = `src/house.json`, `rec` = `src/edition/record.mjs`, `loc` = `src/locale.mjs`,
`kinds` = `src/kinds.mjs`, `rows` = `src/layout/rows.mjs`, `model.md` = `docs/reference/model.md`.

All six works are drawn with `marks: strip`, palette `indigo`, longest strip 360 px (manifest `style`). Card marks
are in the code and are drawn by none of the six works; their rows are marked "not drawn".

Units. A plate figure is laid out in plate px; the edition places it at 2/3 pt per px (`house`:78 `pixelsPerPoint`
1.5; `typ`:202). The PDF content streams confirm it: every plate shape is drawn under the matrix
`0.6667 0 0 -0.6667`. The default PNG is 2400 px for a 1600 pt page (`src/edition/typeset.mjs`:18-20), so one plate
px is one PNG px, and a 1.6 px line is 1.07 pt in the PDF and 1.6 px in the PNG.

States. BOUND: one fact, and the key or the mark's own text explains it. UNBOUND: the difference varies with nothing
a reader can know, or the mark carries no fact at all. AMBIGUOUS: two facts on one channel, one mark that reads as
another, or a difference only colour carries. A mark that only separates regions is listed as BOUND with the
question "none (structure)".

Figure-reading questions used below:

- Q1 Which parts does this view show?
- Q2 What kind of thing is part X?
- Q3 How much code does part X own, and is it more than part Y?
- Q4 How recently did the files of part X change?
- Q5 Which part acts on which?
- Q6 What does the relation from X to Y do?
- Q7 How many files does the model cite for the relation?
- Q8 Is part X inside the described repository?
- Q9 Which tier or layer is part X in?
- Q10 Which part do most relations lead to?
- Q11 Is X built, planned or retired?
- Q12 Where are the files of part X?
- Q13 What question does this plate answer?
- Q14 Which revision and date is drawn?

## 1. Marks and what they carry

| #   | Mark or difference                                                                                                                                       | Channel             | Fact it carries                                                                                                                | Measure           | Origin                                      | Where set                                                       | State     | Question         |
| --- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------ | ----------------- | ------------------------------------------- | --------------------------------------------------------------- | --------- | ---------------- |
| P1  | Width of the figure: 100, 80 or 65 percent of the body                                                                                                   | size                | none; the narrowest share that wires no worse and keeps the type step                                                          | none              | layout                                      | `plates`:99, 260-287                                            | UNBOUND   | none             |
| P2  | Reading beside the figure, above it, or absent ("set" 25, "above" 13, "omitted" 3 of 41)                                                                 | presence, position  | none; a summary the author wrote is printed or dropped by fit                                                                  | none              | layout                                      | `plates`:239-287; `typ`:308-358, 384-385                        | UNBOUND   | none             |
| P3  | Summary text, 17 pt serif                                                                                                                                | text                | the view's summary                                                                                                             | text              | stated                                      | `typ`:309-313, 346-358; `rec`:64                                | BOUND     | Q13              |
| P4  | "File places": part label 14 pt semibold over its paths 13 pt                                                                                            | text                | the paths each shown component claims                                                                                          | text              | stated                                      | `rec`:49-58; `typ`:316-327                                      | BOUND     | Q12              |
| P5  | File places present only when the reading is "set" and fits (`typ`:331-337)                                                                              | presence            | none                                                                                                                           | none              | layout                                      | `rec`:50-51; `typ`:331-337                                      | UNBOUND   | none             |
| P6  | Position of the whole figure in its field: centred vertically, moved sideways to balance ink                                                             | position            | none                                                                                                                           | none              | layout                                      | `fig`:243-246; `plate`:290-301, 325-342                         | UNBOUND   | none             |
| P7  | Typeface: display serif for titles, serif for summaries and contents rows, sans for all else                                                             | shape               | role of the text on the page                                                                                                   | category          | layout                                      | `typ`:17-19, 229, 313, 389                                      | BOUND     | none (structure) |
| P8  | Latin words in serif inside Han words in sans, in one summary sentence                                                                                   | shape               | none; the serif stack falls back to Noto Sans CJK for Han (`typ`:18)                                                           | none              | layout                                      | `typ`:18-19, 313; `house`:13-18                                 | AMBIGUOUS | none             |
| H1  | Plate number, two digits, 34 pt                                                                                                                          | text                | position of the view in the model's list of views                                                                              | order             | derived                                     | `plates`:309; `rec`:40, 60-61; `typ`:540                        | BOUND     | Q13              |
| H2  | Plate number in the accent colour                                                                                                                        | hue                 | none; in the six PDFs it is the same colour as the oldest age band and the hub lines (#334965)                                 | none              | layout                                      | `typ`:540 (`fill: green`); `tok`:170, 182                       | AMBIGUOUS | none             |
| H3  | Plate title, 34 pt display                                                                                                                               | text                | the view's title                                                                                                               | text              | stated                                      | `typ`:229, 540; `plates`:311                                    | BOUND     | Q13              |
| H4  | Plate question, 12.5 pt soft                                                                                                                             | text                | the view's question                                                                                                            | text              | stated                                      | `typ`:230; `plates`:312                                         | BOUND     | Q13              |
| C1  | Part label, bold                                                                                                                                         | text                | the component's label                                                                                                          | text              | stated                                      | `strip`:476-477; `tok`:220                                      | BOUND     | Q1               |
| C2  | Part label size: 18, 20, 24, 28 or 32 px by plate (13, 6, 9, 12, 1 views)                                                                                | size                | none; the largest type step that lays the view out                                                                             | none              | layout                                      | `tok`:53-59; `plate`:421, 470                                   | UNBOUND   | none             |
| C3  | Caption, detail and relation-label size: 14, 16, 18, 20 or 24 px by plate                                                                                | size                | none; same step                                                                                                                | none              | layout                                      | `tok`:53-59, 221-226                                            | UNBOUND   | none             |
| C4  | One size for two roles across plates: 24 px is a part label at step 2 and a detail at step 4; 18 px and 20 px likewise                                   | size                | none                                                                                                                           | none              | layout                                      | `tok`:54-58                                                     | AMBIGUOUS | none             |
| C5  | Bold against regular in the figure: part label, tier label, boundary name bold; caption, detail, relation label regular                                  | shape               | role of the text                                                                                                               | category          | layout                                      | `tok`:219-230; `typ`:389                                        | BOUND     | none (structure) |
| C6  | Part label in muted ink (not drawn: no status in the six works)                                                                                          | lightness           | the component is retired                                                                                                       | category          | stated                                      | `strip`:475                                                     | AMBIGUOUS | Q11              |
| C7  | Strip length                                                                                                                                             | length              | bytes of the files the part owns at the pin, on one scale per edition                                                          | quantity          | measured                                    | `strip`:268-271, 227-234, 50                                    | BOUND     | Q3               |
| C8  | Strip floor: a part with any bytes is at least 2 px                                                                                                      | length              | none; below the floor length stops following bytes, and the key does not say so                                                | none              | layout                                      | `strip`:44, 270                                                 | UNBOUND   | none             |
| C9  | Segments of a strip and the 1 px seams between them                                                                                                      | length, presence    | one segment per owned file, as wide as its share of the part's bytes; files narrower than a seam merge                         | quantity          | measured                                    | `strip`:63, 281-291, 485                                        | AMBIGUOUS | none             |
| C10 | Dye of a segment: three steps, pale to dark                                                                                                              | lightness           | age band of the file's last change before the pin: 7 days, 90 days, earlier                                                    | order             | measured                                    | `strip`:486, 598-607; `tok`:182; manifest `style.bands.spans`   | BOUND     | Q4               |
| C11 | Dashed outline 40 px long (dash 3 2, 1 px) in place of a strip                                                                                           | shape, pattern      | the part owns no files                                                                                                         | category          | measured                                    | `strip`:44, 503-507; `tok`:121                                  | AMBIGUOUS | Q3               |
| C12 | Dashed outline over a strip: long dashes or dots (not drawn)                                                                                             | pattern             | the part is planned or retired                                                                                                 | category          | stated                                      | `strip`:502-507; `tok`:121                                      | AMBIGUOUS | Q11              |
| C13 | Caption left: the kind's label, muted                                                                                                                    | text                | the component's kind                                                                                                           | category          | stated                                      | `strip`:351, 518; `kinds`:23-31                                 | BOUND     | Q2               |
| C14 | Caption right: "N files, M KB" or "owns no files"                                                                                                        | text                | number and bytes of owned files                                                                                                | quantity          | measured                                    | `strip`:294-295, 348-350, 519-529; `loc`:77-78                  | BOUND     | Q3               |
| C15 | Caption count set at the right edge of the part's box, away from the strip                                                                               | position            | none; the box is as wide as the widest of strip, label, caption, detail                                                        | none              | layout                                      | `strip`:392-407, 523                                            | UNBOUND   | none             |
| C16 | Leading detail, "name: values", one to three lines                                                                                                       | text                | the first entry of the component's details                                                                                     | text              | stated                                      | `strip`:352, 370-372, 534-535                                   | BOUND     | Q2               |
| C17 | Detail line spread to its measure (letters spaced apart in Chinese)                                                                                      | position            | none                                                                                                                           | none              | layout                                      | `strip`:376; `typ`:363-373                                      | UNBOUND   | none             |
| C18 | Row a part stands in                                                                                                                                     | position            | the author's tier (2 views) or a layer derived from the relations (39 views); a layer over the row limit wraps to a second row | order, membership | stated or derived                           | `rows`:47-58, 70-80, 111; `plate`:21, 31-51                     | AMBIGUOUS | Q9               |
| C19 | Order of parts along a row and the gaps between them                                                                                                     | position            | none; chosen to reduce crossings and centre the ink                                                                            | none              | layout                                      | `plate`:85-86; `tok`:23                                         | UNBOUND   | none             |
| C20 | Depth of the channel between two rows (stretched up to 1.35)                                                                                             | size                | none                                                                                                                           | none              | layout                                      | `tok`:29; `plate`:255                                           | UNBOUND   | none             |
| K1  | Card frame in grey instead of paper white (not drawn)                                                                                                    | lightness           | the kind is outside the system, or the component is context                                                                    | category          | stated                                      | `fig`:424, 435                                                  | AMBIGUOUS | Q8               |
| K2  | Card bar and icon in green, ochre or grey (not drawn)                                                                                                    | hue                 | category: security is ochre, person and external grey, six others green                                                        | category          | stated                                      | `tok`:172-181; `fig`:426, 437-452                               | AMBIGUOUS | Q2               |
| K3  | Card icon (not drawn)                                                                                                                                    | shape               | the kind                                                                                                                       | category          | stated                                      | `fig`:445-452; `kinds`:29; `plates`:63-72                       | BOUND     | Q2               |
| K4  | Card outline dashed (not drawn)                                                                                                                          | pattern             | planned or retired                                                                                                             | category          | stated                                      | `fig`:427-435                                                   | BOUND     | Q11              |
| K5  | Card drop shadow (not drawn)                                                                                                                             | lightness           | none                                                                                                                           | none              | layout                                      | `fig`:419, 435                                                  | UNBOUND   | none             |
| L1  | A line between two parts                                                                                                                                 | presence            | the view holds a relation between them                                                                                         | membership        | stated                                      | `fig`:343-354                                                   | BOUND     | Q5               |
| L2  | Arrowhead, filled triangle at one end                                                                                                                    | shape, position     | the relation's target                                                                                                          | order             | stated                                      | `fig`:38-64, 393-397                                            | BOUND     | Q5               |
| L3  | Arrowhead 8 px at steps 0 to 3 and 16 px at step 4                                                                                                       | size                | none                                                                                                                           | none              | layout                                      | `tok`:236, 253; `strip`:575-576                                 | UNBOUND   | none             |
| L4  | Line in the darkest dye instead of mid grey (23 of 41 views)                                                                                             | hue, lightness      | the relation ends at the view's hub: the part with at least three incoming relations and more than any other                   | category          | derived                                     | `fig`:337-342; `strip`:192-198, 636-646                         | AMBIGUOUS | Q10              |
| L5  | Line dashed or dotted, dotted lines also paler (not drawn)                                                                                               | pattern, lightness  | planned or retired; a run shared by several relations takes the status of any one of them                                      | category          | stated                                      | `fig`:66-71, 337-345; `tok`:121                                 | AMBIGUOUS | Q11              |
| L6  | One line run shared by several relations                                                                                                                 | position            | none; routing merges them                                                                                                      | none              | layout                                      | `fig`:343 (`relations` per path); `strip`:79-83                 | AMBIGUOUS | none             |
| L7  | Two lines crossing, drawn as a plain cross (45 crossings on 20 of 41 plates)                                                                             | shape               | none                                                                                                                           | none              | layout                                      | `fig`:343-354 (no crossing mark); manifest `measures.crossings` | AMBIGUOUS | none             |
| L8  | Route of a line: bends, which edge and port it leaves by                                                                                                 | position, shape     | none                                                                                                                           | none              | layout                                      | `tok`:71-72, 100-103; `plate`:85-86                             | UNBOUND   | none             |
| L9  | A line crossing the boundary frame                                                                                                                       | position            | none reliably; lines between two inside parts also leave and re-enter the frame (filmkit 05)                                   | none              | layout                                      | `fig`:288-299                                                   | AMBIGUOUS | none             |
| L10 | A relation along a row runs at caption height; its label and arrow sit in line with the caption text (`ethos` 05, filmkit 05, architecture-publisher 01) | position            | none                                                                                                                           | none              | layout                                      | `strip`:92-99; `fig`:318-336                                    | AMBIGUOUS | none             |
| L11 | Relation label on a patch of paper that interrupts the line                                                                                              | text                | the relation's label                                                                                                           | text              | stated                                      | `fig`:494-516; `plate`:198-220                                  | BOUND     | Q6               |
| L12 | Where on the line the label stands                                                                                                                       | position            | none                                                                                                                           | none              | layout                                      | `tok`:78-94                                                     | UNBOUND   | none             |
| L13 | Muted lines under a relation label (not drawn: no relation has details)                                                                                  | text                | the relation's details                                                                                                         | text              | stated                                      | `plate`:204-208; `fig`:506-513                                  | BOUND     | Q6               |
| L14 | Ticks across a line near its source, up to five                                                                                                          | presence (count)    | number of files the relation cites                                                                                             | quantity          | stated                                      | `strip`:57, 71-76, 136-183, 548-563                             | BOUND     | Q7               |
| L15 | A number beside the ticks, 14 px                                                                                                                         | text                | the same number, written when it is over five or when the ticks do not fit (43 of 457 drawn relations cite more than five)     | quantity          | stated                                      | `strip`:175-182, 564-572                                        | AMBIGUOUS | Q7               |
| B1  | Dashed rounded frame (dash 8 5, 1.4 px) on 25 of 41 plates                                                                                               | shape, pattern      | the parts within are inside the described repository                                                                           | membership        | derived                                     | `fig`:278-303; `plates`:61-62, 77-80; `kinds`:5, 30             | BOUND     | Q8               |
| B2  | Name on the frame's edge, bold                                                                                                                           | text                | the repository's name                                                                                                          | text              | stated                                      | `fig`:287, 307; `plates`:139                                    | BOUND     | Q8               |
| B3  | Frame name 20 px at steps 0 and 1, 24 px at steps 2 to 4; its place along the edge moves off crossing lines                                              | size, position      | none                                                                                                                           | none              | layout                                      | `tok`:229; `fig`:298-299                                        | UNBOUND   | none             |
| B4  | No frame at all on 16 plates                                                                                                                             | presence            | no shown part is outside (or all are)                                                                                          | membership        | derived                                     | `plates`:62, 77                                                 | AMBIGUOUS | Q8               |
| B5  | A group drawn as one part (not drawn: no model has groups)                                                                                               | text, length        | the members' files summed; kind label "group"                                                                                  | quantity          | derived                                     | `strip`:208-217; `kinds`:15-22                                  | BOUND     | Q3               |
| T1  | Circled number before a tier label                                                                                                                       | shape, text         | order of the tier in the author's list                                                                                         | order             | derived                                     | `fig`:195-209                                                   | BOUND     | Q9               |
| T2  | Tier label, bold, muted (8 labels on 2 of 41 plates)                                                                                                     | text                | the tier's name                                                                                                                | text              | stated                                      | `fig`:163, 211; `rows`:47-52                                    | BOUND     | Q9               |
| T3  | Bracket before the rows of a wrapped tier (not drawn in the six works)                                                                                   | shape               | those rows are one tier                                                                                                        | membership        | derived                                     | `fig`:83, 167, 172-173, 213-219                                 | BOUND     | Q9               |
| T4  | Tier labels in one column or before the edges of their rows                                                                                              | position            | none (all 41 plates record "column")                                                                                           | none              | layout                                      | `fig`:176-194; `plates`:152                                     | UNBOUND   | none             |
| Y1  | Which entries the key holds                                                                                                                              | presence            | which marks the figure shows                                                                                                   | membership        | derived                                     | `strip`:589-647; `plates`:55-86; `typ`:284-302                  | BOUND     | none (structure) |
| Y2  | Band swatches with "within 7 days of the commit", "within 90 days", "earlier"                                                                            | lightness, text     | names the age bands                                                                                                            | order             | derived                                     | `strip`:598-607; `typ`:243-244; `loc`:79-81                     | AMBIGUOUS | Q4               |
| Y3  | "Commit date YYYY-MM-DD", words without a mark                                                                                                           | text                | the date the bands are counted back from                                                                                       | quantity          | measured                                    | `strip`:608-613; `typ`:288-289                                  | BOUND     | Q14              |
| Y4  | Sample strip with "N KB: a strip's length is the code a part owns"                                                                                       | length, text        | the edition's length scale (50, 100 or 200 KB on the plates read)                                                              | quantity          | derived                                     | `strip`:303-308, 614-625; `typ`:245-247                         | BOUND     | Q3               |
| Y5  | Sample strip drawn in the newest band's dye                                                                                                              | lightness           | none                                                                                                                           | none              | layout                                      | `strip`:622                                                     | AMBIGUOUS | none             |
| Y6  | Three ticks on a line with "one tick per file the relation cites"                                                                                        | shape, text         | names the ticks                                                                                                                | text              | derived                                     | `strip`:626-635; `typ`:248-257                                  | BOUND     | Q7               |
| Y7  | Dark line with arrowhead and "dark lines lead to X"                                                                                                      | lightness, text     | names the hub                                                                                                                  | text              | derived                                     | `strip`:636-646; `typ`:258-264                                  | BOUND     | Q10              |
| Y8  | Small dashed rounded box (16 by 10 pt, dash 2 1.6 pt) with "inside X"                                                                                    | shape, text         | names the frame                                                                                                                | text              | derived                                     | `plates`:77-78; `typ`:239-240                                   | AMBIGUOUS | Q8               |
| Y9  | Dashed or dotted line with "planned" or "retired" (not drawn)                                                                                            | pattern, text       | names the statuses                                                                                                             | text              | derived                                     | `plates`:82-84; `typ`:265-267                                   | AMBIGUOUS | Q11              |
| F1  | Rule above the foot, 0.8 pt                                                                                                                              | presence            | none                                                                                                                           | none              | layout                                      | `typ`:148, 170-175                                              | BOUND     | none (structure) |
| F2  | Foot left: title, release, "commit" and short revision, date                                                                                             | text                | the subject and its pin                                                                                                        | text              | stated and measured                         | `typ`:173; `src/edition/words.mjs`:93                           | BOUND     | Q14              |
| F3  | Foot right: page number, different from the plate number in the head                                                                                     | text                | page in the PDF                                                                                                                | order             | derived                                     | `typ`:174                                                       | BOUND     | none (structure) |
| O1  | Overview page: lines of 1.15 to 4 pt, nine widths over the six works                                                                                     | width               | whatever the composition's author meant; no key on the page                                                                    | none              | stated in the composition, not in the model | `typ`:117; e.g. `publications/ethos/zh/overview.typ`:32-36      | UNBOUND   | none             |
| O2  | Overview page: ring, disc and tick on a line                                                                                                             | shape               | stations of a sequence; the three shapes are not explained, and "tick" means a cited file on plates                            | category          | stated in the composition                   | `typ`:124-128; `ethos/zh/overview.typ`:38-47                    | AMBIGUOUS | none             |
| O3  | Overview page: ochre dashed lines (dash 4 3) and ochre or italic notes                                                                                   | hue, pattern, shape | the author's emphasis; no key                                                                                                  | none              | stated in the composition                   | `typ`:117; `ethos/zh/overview.typ`:25-29, 107-109               | UNBOUND   | none             |
| O4  | Overview page: headings, paragraphs, term and definition lists, tables                                                                                   | text                | free text typed in the composition; no statement id                                                                            | text              | stated in the composition                   | `typ`:74-145                                                    | BOUND     | none (structure) |
| O5  | Overview page: a label fetched with `label-of(id)` (4 call sites, DDWG only)                                                                             | text                | a component's label from the model                                                                                             | text              | stated                                      | `typ`:39                                                        | BOUND     | Q1               |
| V1  | Cover: title 120 pt, question 34 pt, summary 18 pt, three byline facts, a 72 pt accent rule                                                              | text                | model title, question, summary; subject and pin; editors and licence; publisher and Typst versions                             | text              | stated and measured                         | `typ`:476-503; `rec`:114-129                                    | BOUND     | Q14              |
| V2  | Contents: one row per plate with number, title, question, page                                                                                           | text                | the list of views                                                                                                              | order             | stated and derived                          | `typ`:405-427; `rec`:84-89                                      | BOUND     | Q13              |
| V3  | Contents: height of a row grows to fill the body (at least 44 pt)                                                                                        | size                | none                                                                                                                           | none              | layout                                      | `typ`:407-408                                                   | UNBOUND   | none             |

Notes on the AMBIGUOUS rows:

- H2, L4, C10: one colour, three uses. The darkest dye marks files older than 90 days on a strip (`tok`:182), a
  relation into the hub on a line (`fig`:341) and nothing on the plate number. The hub difference is carried by
  colour alone: hub and other lines share width 1.6 px and are both solid.
- C6: muted ink is also the ink of every caption, detail and tier label, and the key shows "retired" as a dotted
  line only.
- C9: the key names the dyes and never says that a segment is a file. Files under 1 px merge (`strip`:287), so the
  segments a reader can count are fewer than the files in the caption (aigw-client 02: 66 files in 360 px).
- C11, Y8: the empty-strip outline has no key entry (`strip`:589-647 and `plates`:55-86 add none). It is a small
  dashed rectangle, and so is the key's sample for the frame. On architecture-publisher 01 both are on one plate.
  Its 40 px length also sits on the length scale: in DDWG 40 px of strip is about 5 KB. All 30 outlines in the six
  works are on outside parts, but 8 outside parts own files and have strips, so the outline does not mean "outside".
- C12, Y9, L5: three dash patterns on strips differ only in pitch (planned 6 4, empty 3 2, retired 1.5 3.5 px at a
  1 px stroke). The key draws the statuses with Typst's `dashed` and `dotted` presets at 1 pt (`typ`:266-267), not
  with the plate's patterns, and one line sample stands for both a part's outline and a relation's line.
- C18: with tiers the row is the author's statement; without, it is the tool's layering, and a wrapped layer looks
  like two layers. See the wrapped-row count in section 2.
- L15: the number is the whole count, not the remainder, and it also appears when the count is five or less and the
  run is short or under a label (`strip`:164, 175). Ticks plus a number can be read as a sum.
- Y2: in the Chinese edition the first two bands use one template, "提交前 N 日内" (`loc`:79-80), so "within 90 days"
  includes "within 7 days" as worded.
- B4: nothing on a plate without a frame says that every part is inside.

## 2. Counts over the six works, Chinese editions

### Kinds of page

From manifest `edition.pages`, `plates` and `overview`: 59 pages. Cover 6, contents 6, overview 6, plate 41,
colophon 0. A colophon page exists in the code (`src/edition/colophon.typ`:1) for accepted deliveries; the review set
holds none.

### Type sizes

Method: the `Tf` operators in the inflated page content streams of the six Chinese PDFs, grouped by page kind in
stream order (cover, contents, overview, then plates). Counts are operators, not characters or runs; a change of
script inside a line adds an operator. The manifest does not record text runs (its plates hold `composition`,
`measures`, `misses`, `images` only), so figure sizes were matched to `tok`:53-59 through `composition.step`.

| Size (pt) | Plate px | Where it occurs                                                                                                | Operators |
| --------- | -------- | -------------------------------------------------------------------------------------------------------------- | --------- |
| 120       |          | cover title (`house`:81)                                                                                       | 10        |
| 34        |          | cover question; "Contents"; overview claim; plate number and title (`house`:8)                                 | 119       |
| 21.33     | 32       | part label at step 4 (1 view)                                                                                  | 8         |
| 18.67     | 28       | part label at step 3 (12 views)                                                                                | 95        |
| 18        |          | cover summary and byline values; contents rows; overview headings and name (`house`:9). Not on plate pages     | 314       |
| 17        |          | summary beside or above a figure (`typ`:309, 347)                                                              | 315       |
| 16        | 24       | part label at step 2 (9 views); caption, detail, relation and tier label at step 4; frame name at steps 2 to 4 | 195       |
| 14        |          | part label in "file places" (`typ`:322)                                                                        | 144       |
| 13.33     | 20       | part label at step 1 (6 views); caption, detail, relation label at step 3; frame name at steps 0 and 1         | 1010      |
| 13        |          | paths in "file places" (`typ`:324)                                                                             | 259       |
| 12.5      |          | body text: plate question, overview text, contents (`house`:10)                                                | 1467      |
| 12        | 18       | part label at step 0 (13 views); caption, detail, relation label at step 2                                     | 1004      |
| 11        |          | key, foot, small labels (`house`:11)                                                                           | 1257      |
| 10.67     | 16       | caption, detail, relation label at step 1                                                                      | 528       |
| 9.33      | 14       | caption, detail, relation label at step 0; tier number and tick count at every step (`tok`:13, 227-228)        | 1412      |

Fifteen distinct sizes; thirteen on plate pages. The house class declares four (`house`:7-12) and `typ`:21 calls
them "the four type sizes"; 17, 14 and 13 pt are literals in `typ`:309, 322, 324, 347, and the eight figure sizes
come from the nine-step scale in `tok`:14. Type steps over the 41 views (manifest `composition.step`): step 0 13,
step 1 6, step 2 9, step 3 12, step 4 1.

### Typefaces

Method: `pdffonts` on the six PDFs. Seven fonts: Source Sans 3 Regular (6 PDFs), Semibold (6), Italic (5; used only
by overview compositions); Source Serif 4 Regular (6); Source Serif 4 Subhead Regular (6); Noto Sans CJK SC Regular
(6), Bold (6). Declared in `house`:13-18. There is no Han serif, so Chinese summaries declared serif are set in
Noto Sans with Latin words in Source Serif (row P8).

### Line widths

Method: `w` operators in the inflated page streams; plate shapes are under the 2/3 matrix, so their value is in
plate px. PDF omits a width of 1, so 1 px strokes were counted through their dash pattern.

| Value                                        | Unit         | Where                                                         | Operators in six PDFs           |
| -------------------------------------------- | ------------ | ------------------------------------------------------------- | ------------------------------- |
| 1.6                                          | px (1.07 pt) | every relation line and tick (`tok`:125)                      | 1020                            |
| 1.4                                          | px (0.93 pt) | frame (25) and tier circles (8) (`fig`:199, 302)              | 33                              |
| 1                                            | px (0.67 pt) | empty-strip outline (`strip`:506)                             | 30, by dash count               |
| 1.067                                        | pt           | key samples of ticks and hub, at plate scale (`typ`:250, 260) | 187                             |
| 0.7                                          | pt           | key sample of the frame (`typ`:240)                           | 25                              |
| 0.8                                          | pt           | rules: foot, contents rows, overview (`typ`:148, 421)         | 221                             |
| 1.15, 1.5, 1.7, 1.8, 2.0, 2.2, 2.4, 2.6, 4.0 | pt           | overview compositions; 2.4 is also the cover rule (`typ`:482) | 1, 24, 18, 8, 15, 32, 17, 4, 15 |

On plate figures: three widths, of which only one (1.6 px) is on relation lines. In the code and not drawn: 1.2 px
card outline (`fig`:435), 2 px icon strokes (`fig`:76), 1 pt status samples (`typ`:267).

### Dash patterns

Method: `d` operators in the same streams. `3 2` px 30 times (empty-strip outline, `tok`:121), `8 5` px 25 times
(frame, `fig`:302), `2 1.6` pt 25 times (key sample of the frame, `typ`:240), `4 3` pt 13 times (overview
compositions). Defined and never drawn: `6 4` planned and `1.5 3.5` retired (`tok`:121), Typst `dashed` and `dotted`
(`typ`:267). No component and no relation of the six models has a `status` (model JSON, counted).

### Colours on plate pages

Method: distinct `scn`/`SCN` operands on the 41 plate streams. Nine: paper #f6f5f1, ink #25282c, text grey #4f5154,
line grey #656769, rule #c5c5c3, frame #7f8182 (25 plates), dyes #b7d8db, #7099ae, #334965. Which grey is "soft" and
which "mid" was read from the pictures, not from `src/style.mjs`.

### Regions each view's parts use

Method: manifest `views`, `plates`, `evidence`, `sources.records[].owner`, and the Chinese `model.json` for kinds
and details. Regions per `strip`:316-323, 455-536: label, strip (or empty outline), caption, leading detail. Strip
marks draw no icon and no frame around a part. "More details" counts parts whose model holds two or more details;
the plate prints the first only (`strip`:352). "Hub" was recomputed from the rule in `strip`:192-198.

| Work                   | Plate           | Parts | Strip | Empty outline | Label | Caption | More details not shown | Icon or part frame | Boundary | Tier labels | Relations | Cite over 5 | Cite 0 | Hub | Step | Wrap limit | Share | Reading |
| ---------------------- | --------------- | ----- | ----- | ------------- | ----- | ------- | ---------------------- | ------------------ | -------- | ----------- | --------- | ----------- | ------ | --- | ---- | ---------- | ----- | ------- |
| aigw-client            | 01 overview     | 9     | 9     | 0             | 9     | 9       | 4                      | 0                  | yes      | 0           | 9         | 5           | 0      | yes | 0    | 3          | 0.8   | set     |
| aigw-client            | 02 authority    | 7     | 7     | 0             | 7     | 7       | 5                      | 0                  | no       | 0           | 10        | 4           | 0      | no  | 3    | 6          | 0.65  | set     |
| aigw-client            | 03 adapters     | 9     | 9     | 0             | 9     | 9       | 1                      | 0                  | yes      | 0           | 14        | 7           | 0      | no  | 0    | 6          | 0.8   | set     |
| aigw-client            | 04 readiness    | 8     | 8     | 0             | 8     | 8       | 5                      | 0                  | no       | 0           | 12        | 5           | 0      | yes | 1    | 6          | 0.8   | set     |
| aigw-client            | 05 program      | 8     | 8     | 0             | 8     | 8       | 4                      | 0                  | no       | 0           | 9         | 3           | 0      | yes | 3    | 6          | 0.8   | set     |
| aigw-client            | 06 projection   | 7     | 7     | 0             | 7     | 7       | 4                      | 0                  | no       | 0           | 10        | 5           | 0      | yes | 2    | 6          | 0.8   | set     |
| architecture-publisher | 01 overview     | 9     | 6     | 3             | 9     | 9       | 5                      | 0                  | yes      | 5           | 10        | 0           | 2      | no  | 0    | 6          | 0.8   | set     |
| architecture-publisher | 02 files        | 7     | 6     | 1             | 7     | 7       | 3                      | 0                  | yes      | 0           | 11        | 0           | 0      | yes | 3    | 6          | 0.8   | set     |
| architecture-publisher | 03 models       | 7     | 6     | 1             | 7     | 7       | 3                      | 0                  | yes      | 0           | 7         | 0           | 1      | no  | 4    | 6          | 0.8   | set     |
| architecture-publisher | 04 layout       | 8     | 8     | 0             | 8     | 8       | 1                      | 0                  | no       | 3           | 7         | 0           | 0      | no  | 2    | 6          | 1     | above   |
| architecture-publisher | 05 edition      | 10    | 9     | 1             | 10    | 10      | 5                      | 0                  | yes      | 0           | 15        | 0           | 0      | yes | 0    | 4          | 1     | omitted |
| architecture-publisher | 06 page         | 7     | 6     | 1             | 7     | 7       | 3                      | 0                  | yes      | 0           | 8         | 0           | 0      | no  | 3    | 6          | 0.8   | set     |
| ddwg                   | 01 overview     | 9     | 9     | 0             | 9     | 9       | 1                      | 0                  | no       | 0           | 14        | 0           | 0      | yes | 0    | 6          | 1     | above   |
| ddwg                   | 02 readers      | 8     | 7     | 1             | 8     | 8       | 2                      | 0                  | yes      | 0           | 13        | 0           | 0      | yes | 3    | 6          | 0.8   | set     |
| ddwg                   | 03 practice     | 9     | 9     | 0             | 9     | 9       | 0                      | 0                  | no       | 0           | 13        | 0           | 0      | yes | 0    | 6          | 1     | above   |
| ddwg                   | 04 change       | 9     | 8     | 1             | 9     | 9       | 1                      | 0                  | yes      | 0           | 12        | 0           | 0      | yes | 0    | 6          | 0.8   | set     |
| ddwg                   | 05 checks       | 9     | 8     | 1             | 9     | 9       | 0                      | 0                  | yes      | 0           | 14        | 0           | 0      | yes | 2    | 6          | 1     | above   |
| ddwg                   | 06 release      | 8     | 7     | 1             | 8     | 8       | 1                      | 0                  | yes      | 0           | 13        | 0           | 0      | yes | 2    | 4          | 1     | above   |
| `ethos`                | 01 overview     | 8     | 8     | 0             | 8     | 8       | 6                      | 0                  | no       | 0           | 9         | 2           | 0      | yes | 3    | 3          | 0.65  | set     |
| `ethos`                | 02 status       | 9     | 9     | 0             | 9     | 9       | 7                      | 0                  | no       | 0           | 14        | 2           | 0      | yes | 0    | 6          | 0.8   | set     |
| `ethos`                | 03 intent       | 10    | 9     | 1             | 10    | 10      | 6                      | 0                  | yes      | 0           | 11        | 1           | 0      | yes | 0    | 6          | 1     | omitted |
| `ethos`                | 04 proof        | 10    | 9     | 1             | 10    | 10      | 6                      | 0                  | yes      | 0           | 15        | 0           | 0      | yes | 0    | 6          | 1     | above   |
| `ethos`                | 05 admission    | 10    | 10    | 0             | 10    | 10      | 5                      | 0                  | no       | 0           | 15        | 0           | 0      | yes | 1    | 6          | 1     | above   |
| `ethos`                | 06 lanes        | 9     | 9     | 0             | 9     | 9       | 5                      | 0                  | no       | 0           | 14        | 3           | 0      | yes | 2    | 3          | 0.8   | set     |
| `ethos`                | 07 commits      | 8     | 7     | 1             | 8     | 8       | 4                      | 0                  | yes      | 0           | 10        | 3           | 0      | no  | 1    | 6          | 1     | above   |
| `ethos`                | 08 peers        | 10    | 8     | 2             | 10    | 10      | 5                      | 0                  | yes      | 0           | 12        | 0           | 0      | yes | 0    | 6          | 0.8   | set     |
| `ethos`                | 09 structure    | 10    | 9     | 1             | 10    | 10      | 3                      | 0                  | yes      | 0           | 7         | 1           | 0      | no  | 3    | 4          | 1     | above   |
| `ethos`                | 10 runtime      | 10    | 9     | 1             | 10    | 10      | 6                      | 0                  | yes      | 0           | 13        | 2           | 0      | no  | 0    | 6          | 1     | above   |
| `ethos`                | 11 surfaces     | 10    | 10    | 0             | 10    | 10      | 8                      | 0                  | no       | 0           | 13        | 0           | 0      | no  | 2    | 6          | 1     | above   |
| filmkit                | 01 overview     | 8     | 8     | 0             | 8     | 8       | 8                      | 0                  | no       | 0           | 10        | 0           | 0      | yes | 2    | 4          | 0.8   | set     |
| filmkit                | 02 film         | 8     | 7     | 1             | 8     | 8       | 7                      | 0                  | yes      | 0           | 10        | 0           | 0      | no  | 1    | 6          | 0.8   | set     |
| filmkit                | 03 narration    | 7     | 5     | 2             | 7     | 7       | 7                      | 0                  | yes      | 0           | 11        | 0           | 0      | no  | 3    | 6          | 0.8   | set     |
| filmkit                | 04 sound        | 8     | 7     | 1             | 8     | 8       | 6                      | 0                  | yes      | 0           | 11        | 0           | 0      | no  | 3    | 6          | 0.8   | set     |
| filmkit                | 05 picture      | 9     | 7     | 2             | 9     | 9       | 7                      | 0                  | yes      | 0           | 13        | 0           | 0      | no  | 0    | 3          | 1     | omitted |
| filmkit                | 06 acceptance   | 8     | 6     | 2             | 8     | 8       | 4                      | 0                  | yes      | 0           | 11        | 0           | 0      | yes | 1    | 6          | 0.8   | set     |
| openai-responses-proxy | 01 request-path | 9     | 7     | 2             | 9     | 9       | 9                      | 0                  | yes      | 0           | 11        | 0           | 0      | no  | 2    | 6          | 1     | above   |
| openai-responses-proxy | 02 portability  | 7     | 7     | 0             | 7     | 7       | 7                      | 0                  | no       | 0           | 11        | 0           | 0      | yes | 3    | 6          | 1     | above   |
| openai-responses-proxy | 03 failures     | 7     | 6     | 1             | 7     | 7       | 7                      | 0                  | yes      | 0           | 9         | 0           | 0      | no  | 3    | 6          | 0.8   | set     |
| openai-responses-proxy | 04 install      | 8     | 8     | 0             | 8     | 8       | 8                      | 0                  | no       | 0           | 11        | 0           | 0      | no  | 2    | 6          | 0.8   | set     |
| openai-responses-proxy | 05 handoff      | 7     | 7     | 0             | 7     | 7       | 7                      | 0                  | no       | 0           | 9         | 0           | 0      | yes | 1    | 6          | 0.8   | set     |
| openai-responses-proxy | 06 supervision  | 6     | 5     | 1             | 6     | 6       | 6                      | 0                  | yes      | 0           | 6         | 0           | 0      | no  | 3    | 3          | 0.8   | set     |

Totals: 344 parts drawn, 314 with a strip, 30 with the empty outline, 344 with a caption and one leading detail (every
component of the six models has at least one detail), 192 with further details that the plate does not print. 457
relations drawn (352 distinct): 411 cite one to five files, 43 more than five, 3 none. Boundary on 25 plates, hub on
23, tier labels on 2. Share 1: 16 plates, 0.8: 23, 0.65: 2. Crossings 45 on 20 plates. 33 of 41 plates record at
least one miss of the balance measures (manifest `plates[].misses`).

Test of the three detail levels (item 3 of the details). All 344 parts use one and the same set of regions: label,
strip or outline, caption, one detail. The engine offers no other set with strip marks (`strip`:316-323), and no
component lacks details, so today's plates show one level and cannot show whether three nested levels are enough.
What they do show: the caption (kind and counts) and the detail are separate regions with separate facts, and the
detail region is cut to one entry on 192 parts. Whether each view's question needs each region was not judged per
view.

### Wrapped rows (item 7 of the details)

A row over the limit wraps (`rows`:70-80). Only a tier with a label gets a bracket over its rows (`fig`:156, 167,
213-219). Two views have tiers; neither wrapped, and no bracket is drawn in the six PDFs (the 33 strokes of 1.4 px
are 25 frames and 8 tier circles). Nine views were composed at a limit below 6 (limit 3: aigw-client 01, `ethos` 01,
`ethos` 06, filmkit 05, openai-responses-proxy 06; limit 4: architecture-publisher 05, ddwg 06, `ethos` 09, filmkit 01).
None has tiers, so if a layer was split there, nothing on the plate shows that two rows are one layer. Whether a
layer was in fact split is not in the manifest (it records the limit, not the rows): not measured.

### Scale of the strips

Method: the largest sum of owned bytes per component in `sources.records`. The 360 px of the longest strip stand
for 478 KB (aigw-client), 239 KB (`ethos`), 233 KB (filmkit), 109 KB (architecture-publisher), 56 KB
(openai-responses-proxy), 47 KB (ddwg). One px of strip is 1.3 KB in one edition and 0.13 KB in another. The key's
sample (row Y4) states the scale on each plate.

### Overview compositions (item 5 of the details)

Method: call sites in the six Chinese `overview.typ` files of `architecture-publications/publications/<work>/zh/`.
The English files have the same call counts, so twelve files hold twice these numbers. A loop draws several marks
from one call site, so these are not counts of drawn marks.

| Work                   | `head` | `tx` | `txc` | `dl` | `seg` | `ring` | `disc` | `tick` | arrows | `hrule` | `label-of` |
| ---------------------- | ------ | ---- | ----- | ---- | ----- | ------ | ------ | ------ | ------ | ------- | ---------- |
| aigw-client            | 9      | 25   | 4     | 5    | 11    | 8      | 1      | 1      | 1      | 4       | 0          |
| architecture-publisher | 6      | 23   | 7     | 4    | 11    | 5      | 1      | 4      | 2      | 3       | 0          |
| ddwg                   | 7      | 21   | 4     | 5    | 7     | 6      | 2      | 1      | 0      | 4       | 4          |
| `ethos`                | 11     | 20   | 5     | 7    | 10    | 6      | 2      | 3      | 2      | 4       | 0          |
| filmkit                | 14     | 16   | 8     | 5    | 6     | 5      | 0      | 3      | 0      | 4       | 0          |
| openai-responses-proxy | 9      | 7    | 10    | 6    | 6     | 6      | 0      | 3      | 0      | 4       | 0          |

ETHOS, split by reading the source and the rendered page: masthead (text); one sequence of six roles with stations,
a return line and a dashed annotation line; five short texts under the roles; seven term and definition lists; a
second sequence of six steps with a branch; one table of four columns by three rows; two paragraphs; the foot. The
five kinds figure, sequence, table, text and list cover it, with "list" meaning a term and definition list and no
block of kind "figure". The other five compositions were not split by reading: not measured beyond the call counts.

Marks that trace to no statement id: every mark of the six overview pages except the four `label-of` texts in DDWG
and the tool's own lines (the "built at" line `typ`:164 and the foot `typ`:173). The class offers one link to the
model, `label-of` (`typ`:39); all other text and every line, ring, disc and tick is typed or drawn freely.

### Classes of relation labels (item 6 of the details)

Method: the 352 labels of manifest `evidence.relations`, Chinese, read once beside their English counterparts and
classified by hand. No script reproduces it.

| Class                                                                             | aigw-client | architecture-publisher | ddwg | `ethos` | filmkit | openai-responses-proxy | Total |
| --------------------------------------------------------------------------------- | ----------- | ---------------------- | ---- | ------- | ------- | ---------------------- | ----- |
| Verb phrase whose subject is the source part ("reads the Lease")                  | 35          | 49                     | 8    | 89      | 54      | 45                     | 280   |
| Noun phrase naming content or a topic ("risk levels")                             | 5           | 0                      | 42   | 0       | 0       | 0                      | 47    |
| Command or file names alone ("update-ref --stdin")                                | 0           | 4                      | 1    | 1       | 1       | 0                      | 7     |
| Bare verbs naming an activity whose subject is not the source ("frame, diagnose") | 0           | 0                      | 13   | 0       | 0       | 0                      | 13    |
| Clause with its own subject ("Agents start here")                                 | 0           | 0                      | 3    | 0       | 0       | 0                      | 3     |
| Negation ("no gates")                                                             | 0           | 0                      | 2    | 0       | 0       | 0                      | 2     |
| Total                                                                             | 40          | 53                     | 69   | 90      | 55      | 45                     | 352   |

Three classes (verb phrase, noun phrase, command name) hold 334 of 352 labels, 94.9 percent. The other 18 are all in
DDWG. Five works are verb phrases almost throughout; DDWG is noun phrases for 42 of 69. Also counted by script: 61
labels join two or more items with a list mark, 27 labels repeat another label of the same model, length 2 to 22
characters, mean 5.9. The five "guarded writes" and "owner-only files" labels of aigw-client were put with the
noun phrases; in Chinese they can also be read as verb phrases.

## 3. Where the vocabulary fails

1. A part's box. Placement, routing and the right edge of the caption all use a rectangle that is never drawn
   (`strip`:15-17, 392-407). It is not a carrier a reader sees, not a region and not a channel, yet it decides
   where the count stands (row C15) and where lines end. The vocabulary needs a word for an undrawn extent.
2. A fact on two carriers at once. The age-band dye is a channel of the strip, and the same dye is a channel of the
   relation line with another fact (rows C10, L4). "Channel" is defined per carrier, so the table cannot say that a
   value table is shared across carriers except in a note.
3. A fact on two channels. Owned bytes are a length and a text (C7, C14); the count of cited files is ticks and
   sometimes a number (L14, L15); a tier's order is a position and a number (C18, T1). The vocabulary has no word for
   redundant coding, nor for the rule that decides which of the two is authoritative.
4. Facts with no mark. `kinds.category` and `kinds.icon` are stated in every model and drawn nowhere with strip
   marks; the second and later details of 192 parts are stated and not printed; a relation's cited files are counted
   and not named; the hub rule's threshold is nowhere on the plate. A binding table of marks cannot list them; it
   needs a second table from facts to marks.
5. Marks whose meaning is their place in a sentence. The key's "commit date" entry has no sample (Y3), and the key
   as a whole is a carrier whose marks stand for other marks. "Fact" does not fit: the key carries bindings, not
   facts.
6. Negative space. "No frame" (B4), "no reading" (P2), "no key entry" are differences of presence at the level of
   the page, and the plate does not say which absences mean something.
7. Scale that changes between editions. Strip length is bound within an edition and means ten times as much in
   another (section 2). "Scale" needs a scope: plate, edition, or all editions. The age bands have the widest scope,
   strip length the middle one, type size none.
8. The overview page. Its marks are stated by an author in a composition, not in the model, and have no statement
   id and no key. Origin has four values in the brief (stated in the model, measured, derived, chosen by layout);
   this is a fifth, "stated outside the model".
9. Routing artefacts that look like marks: crossings, shared runs, a line passing through the frame, a line at
   caption height (L6, L7, L9, L10). They are not carriers and carry no fact, yet a reader has to rule them out. The
   vocabulary has no class for a visible thing that must be read as nothing.
10. Text roles. Weight, typeface and size together tell a label from a caption from a note. The role is a category
    carried by three channels at once, and the size channel is also driven by the layout (C2 to C4).
11. The PDF link on a part label (`rec`:42-46; `typ`:395-398) is an action with no visible mark; "channel" has no
    value for it.

## 4. Candidates

Marks to delete or to stop varying (they answer no question):

- P1, P2, P5: the three figure widths and the dropped reading. Three views lose a summary the author wrote.
- C2, C3, C4, L3, B3: the five type steps and what scales with them. The roadmap already lists "automatic type-size
  tiers deleted" for step 5b; the count here is 13, 6, 9, 12, 1 views per step.
- C9: the seams, unless the key says a segment is a file.
- C15, C17: the count at the far edge of an undrawn box, and letters spread to a measure.
- L4 with Y7: the hub's dark lines. The fact is derived, readable from the arrowheads, carried by colour alone, and
  shares its colour with the oldest age band. If the hub stays it needs its own channel.
- H2: the accent colour on the plate number.
- Y5: the newest-band dye on the sample strip.
- K5: the card shadow.
- O1 to O3 on the overview page stay unbound until the composition has a key or a fixed value table.

Bindings to split:

- Darkest dye: oldest age band, hub line, plate number (C10, L4, H2).
- Dashed rectangle: empty strip, key sample of the frame, the frame itself, status outlines (C11, C12, B1, Y8).
- Row position: stated tier, derived layer, wrapped half of a layer (C18).
- Tick: a cited file on plates, a station on overview pages (L14, O2).
- Number beside ticks: over five, or no room (L15).
- Grey card: outside kind, or context component (K1). Card hue: eight categories on three hues, with "security"
  told by ochre alone (K2).
- Status on a shared run: one retired relation greys the whole run (L5).
- Band wording in Chinese: the 7-day and 90-day bands share one template (Y2).

Constants that are missing:

- A fixed set of type sizes on plate pages. Today there are thirteen, and the declared four cover 11, 12.5 and 34 pt
  only.
- One size per text role in the figure, the same on every plate.
- A stated strip scale with a stated scope, and the 2 px floor and the 40 px empty length written in the key or
  removed.
- Key entries for the empty outline, the tick count, the arrowhead and the tier number.
- Key samples at the plate's own scale for the frame and the statuses (the frame sample is 2 by 1.6 pt dashes for a
  5.33 by 3.33 pt pattern on the plate).
- A mark for "these two rows are one layer" when there are no tier labels, or a rule that layers never wrap.
- A mark that tells a crossing from a join, and a rule for lines that pass the frame.
- A fixed figure width and a fixed place for the reading.
- A value table for line widths and shapes on overview pages (nine widths today).
- Disjoint wording for the age bands.

## 5. Unverified

- `src/poster/text.mjs` was not read; `docs/reference/operations.md` and `src/locale.mjs` were searched, not read in
  full; `src/style.mjs` (how a palette resolves to roles) was not read. The claim that the plate number, the hub
  lines and the oldest band share #334965 rests on the nine colours found in the plate streams and on three
  pictures, not on the code.
- Page kind was assigned to PDF content streams by their order in the file. The 120 pt size appearing in exactly one
  group supports it; the page tree was not parsed.
- Type-size counts are `Tf` operators; they rank sizes roughly and are not character counts. Which size a given word
  has was inferred from the code and the step, not read word by word.
- Line widths: the 2/3 matrix was seen on every sampled stroke of 1.6; the matrix was not tracked operator by
  operator, so a few `w` values in the table could belong to another scale.
- Five pictures were read: architecture-publisher 01, `ethos` 00 and 05, aigw-client 02, filmkit 05, all Chinese. Rows
  L6 (shared runs) and C6, C12, K1 to K5, L5, L13, T3, Y9, B5 describe code that these pictures do not show. Cover
  and contents pages were described from `typ` and the PDF text sizes, not from a rendering. No English edition and
  no colophon page was read.
- Rows L9 and L10 are from three pictures; how many plates show them was not counted.
- The hub count (23) was recomputed from the manifest with the rule of `strip`:192-198; it was checked against the
  key on three pictures only.
- "Empty outline" was derived from `sources.records[].owner`; the 30 agree with the 30 `3 2` dash operators in the
  PDFs.
- The classification of the 352 relation labels is one reader's single pass; the borderline cases are named in
  section 2.
- Whether each view's question needs each region (item 3) and whether any layer was actually wrapped (item 7) were
  not measured.
- The overview compositions of five works were counted by call site, not split into blocks by reading.
- The manifest was said to record text runs; in format version 7 it does not, so no run-level check of positions or
  widths was made.
