#import "@preview/catppuccin:1.0.0": catppuccin, flavors

#let left_padding = 50pt
#let title_width = 370pt

#let section_counter = state("section_counter", 0)

#let pill(image_path) = {
  let w = 600pt
  let h = 600pt
  let img = image(image_path, width: w, height: h, fit: "cover")

  let pat = tiling(
    size: (w, h),
  )[
    #img
  ]

  let shape = curve(
    fill: pat,
    stroke: none,
    curve.move((159.713pt, 75.5413pt)),
    curve.cubic(
      (260.435pt, -25.1804pt),
      (423.737pt, -25.1804pt),
      (524.459pt, 75.5413pt),
    ),
    curve.cubic(
      (625.18pt, 176.263pt),
      (625.18pt, 339.565pt),
      (524.459pt, 440.287pt),
    ),
    curve.line((440.287pt, 524.459pt)),
    curve.cubic(
      (339.565pt, 625.18pt),
      (176.263pt, 625.18pt),
      (75.5413pt, 524.459pt),
    ),
    curve.cubic(
      (-25.1804pt, 423.737pt),
      (-25.1804pt, 260.435pt),
      (75.5413pt, 159.713pt),
    ),
    curve.line((159.713pt, 75.5413pt)),
    curve.close(),
  )

  shape
}

#let slides(title: none, body) = {
  show: catppuccin.with(flavors.mocha)

  set document(
    title: title,
  )

  set text(size: 25pt, font: "Inter 24pt", fill: flavors.mocha.colors.text.rgb)

  set page(
    paper: "presentation-16-9",
    margin: (
      left: 50pt,
      right: 50pt,
      top: 50pt,
      bottom: 50pt,
    ),
  )

  show heading.where(level: 1): set text(size: 40pt, weight: 600)
  show heading: set block(below: 0.75em)

  show heading.where(level: 2): set text(size: 30pt, weight: 500)

  show heading.where(level: 3): set text(size: 25pt, weight: 500)

  set text(size: 16pt)

  body
}

#let title-slide(title: str, subtitle: none, image: none) = {
  show heading.where(level: 1): set text(size: 60pt, weight: 500)
  show heading: set block(below: 0.54em)

  set page(
    paper: "presentation-16-9",
    margin: (
      left: 50pt,
      right: 0pt,
      top: 50pt,
      bottom: 50pt,
    ),
  )

  page[
    #set align(horizon)
    #stack(
      dir: ltr,
      block(width: if image != none { 370pt } else { auto })[
        #show heading: set par(leading: 0.5em)
        #heading(
          level: 1,
        )[= #title]
        #block(above: 35pt)[
          #text(fill: flavors.mocha.colors.mauve.rgb, size: 20pt, weight: 500)[#subtitle]
        ]
      ],
      if image != none {
        pill(image)
      },
    )
  ]
}

#let section-slide(title, subtitle: none) = {
  show heading.where(level: 1): set text(size: 40pt, weight: 600)
  show heading: set block(below: 0.54em)

  context {
    section_counter.update(n => n + 1)
    let current = section_counter.get()

    page[
      #set align(horizon)
      #block[
        #set align(left + top)
        #stack(
          dir: ltr,
          spacing: 10pt,
          block[
            #show heading: set par(leading: 0.5em)
            #show heading: set text(fill: flavors.mocha.colors.mauve.rgb)
            #heading(
              level: 1,
            )[= #current.]
          ],
          block[
            #show heading: set par(leading: 0.5em)
            #heading(
              level: 1,
            )[= #title]
            #if subtitle != none {
              block(above: 10pt)[
                #text(fill: flavors.mocha.colors.mauve.rgb, size: 16pt, weight: 500)[#subtitle]
              ]
            }
          ],
        )
      ]
    ]
  }
}

// #slides()
// #title-slide(
//   title: "Agin Slides",
//   subtitle: "A Catppuccin theme for creating presentations with Typst",
// )


