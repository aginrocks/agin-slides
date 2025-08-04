#import "lib.typ": *

#show: slides.with(title: "Agin Slides")

#title-slide(
  title: "Agin Slides",
  subtitle: "A Catppuccin theme for creating presentations with Typst",
  image: "image.jpg",
)

#section-slide("Introduction", subtitle: "What is Agin Slides?")

#page[
  == Introduction
  Agin Slides is a Typst theme designed to create beautiful and functional presentations. It is inspired by the Catppuccin color palette, which provides a soothing and visually appealing aesthetic.
  The theme includes various slide layouts, typography styles, and color schemes that can be easily customized
]

#section-slide("Examples", subtitle: "How to use this theme")

#page[
  Import `lib.typ` to access the theme's features and styles.
  ```typst
  #import "lib.typ": *

  #show: slides.with(title: "Agin Slides")

  #title-slide(
    title: "Agin Slides",
    subtitle: "A Catppuccin theme for creating presentations with Typst",
    image: "image.jpg",
  )

  #section-slide("Introduction", subtitle: "What is Agin Slides?")
  ```
]
