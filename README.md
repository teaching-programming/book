Book Template created by [Charlotte Desvages](https://github.com/chdesvages) and [Pawel Orzechowski](https://github.com/drpawelo). More references below.

## Inserting citations:

[https://quarto.org/docs/authoring/citations.html](Quarto%20documentation%20about%20citations)

# TODO: To be cleaned up - copied from Charlotte's Hello World Repo.

# Display settings toolbar for Quarto

This is a setup for a display settings toolbar in Quarto, accessed via the menu at the top of the right margin. Source code is available [on GitHub](https://github.com/chdesvages/quarto-display-settings), as well as a [demonstration page](https://chdesvages.github.io/quarto-display-settings/).

![A colourful image to demonstrate hue and sepia settings.](chalk.jpg)

How it works:

-   `_theme/_accessibility_sidebar.qmd` contains a [raw HTML block](https://quarto.org/docs/authoring/markdown-basics.html#raw-content) to display the sliders and settings.
-   `_theme/accessibility.html` contains the JavaScript to grab the slider values and use them to define the relevant CSS variables, in a `<script>` tag.
-   `_theme/styles.css` sets the relevant CSS properties using these variables.
-   `_theme/atkinson.scss` makes the [Atkinson Hyperlegible](https://www.brailleinstitute.org/freefont/) font available as an option. Credit to [druedin](https://github.com/druedin/atkinson_quarto).

The display settings box is inserted as a `margin-header`, the JavaScript is in `include-before-body`, and the relevant CSS files are included in `_quarto.yml` as follows:

``` yaml
project:
    type: website

format:
    html:
        theme: [cosmo, _theme/atkinson.scss]
        css: _theme/styles.css
        include-before-body:
            file: _theme/accessibility.html
        grid:
          margin-width: 350px

website:
    title: "Display settings toolbar for Quarto"
    margin-header: _theme/_accessibility_sidebar.qmd
```
