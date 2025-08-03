#import "@preview/catppuccin:1.0.0": catppuccin, flavors

#show: catppuccin.with(flavors.mocha)

#let left_padding = 50pt
#let title_width = 370pt

#let pill(image_path) = {
  context {
    let w = 600pt
    let img = image(image_path, width: w, height: page.height, fit: "cover")

    let pat = tiling(
      size: (w, page.height),
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
}


#let slides(content, title: none, subtitle: none) = {
  set document(
    title: title,
  )

  set text(size: 25pt, font: "Inter 24pt")

  set page(
    paper: "presentation-16-9",
    margin: (
      left: 50pt,
      right: 0pt,
      top: 0pt,
      bottom: 0pt,
    ),
  )

  show heading.where(level: 1): set text(size: 60pt, weight: 500)

  page[
    #set align(horizon)
    #stack(
      dir: ltr,
      block(width: 370pt)[
        #show heading: set par(leading: 0.5em)
        #heading(
          level: 1,
        )[= #title]
        #block(above: 40pt)[
          #text(fill: flavors.mocha.colors.mauve.rgb, size: 20pt)[#subtitle]
        ]
      ],
      pill("image.jpg"),
    )
  ]
}

