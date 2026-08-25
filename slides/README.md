# Lecture decks

One [Quarto revealjs](https://quarto.org/docs/presentations/revealjs/) deck per topic-opening
meeting, authored in markdown with code that executes at render time. Rendered decks are
published at `https://bu-cds-bf550.github.io/slides/<name>.html` with a PDF beside each one;
the week pages and [`/slides/`](https://bu-cds-bf550.github.io/slides/) link to them from
[`_data/slides.yml`](../_data/slides.yml).

## Authoring

1. Copy [`_template.qmd`](_template.qmd) to `week-NN.qmd`. The template demonstrates every
   construct the decks use: reveals (`. . .`), incremental lists, columns, executed Python
   with hidden or shown code, figures, output-on-the-next-slide, Graphviz/Mermaid diagrams,
   static images (`img/`), and speaker notes.
2. Add a line to `_data/slides.yml`. That single entry makes the week page show *view · PDF*
   links and adds the row on `/slides/`.
3. Push. CI renders the deck, exports the PDF, gates the site, and deploys.

Conventions the decks inherit from the textbook (see its `CONVENTIONS.md`):

- **Activation, not delivery.** The reading carries first exposure; a deck puts the week's
  ideas to work. A deck that re-teaches its chapter is too long.
- **Seed every random draw**, reusing the chapter's seeds where a chunk comes from the
  chapter, so what is projected in class is exactly what students find in the reading.
- **Slide headings are a public interface.** The instructor run-sheets cite slides by
  heading text, not by number. Adding or reordering slides is free; renaming a heading means
  updating that week's run-sheet.

### Speaker notes

Write them inline, under the slide they belong to:

```markdown
::: {.notes}
Ask for a show of hands before advancing.
:::
```

`strip-notes.lua` removes every `.notes` block from the public build, and
`tools/lint_no_instructor_content.py` fails the site build if a note ever reaches `_site/`.
The instructor build keeps them: `tools/build_slides.sh --instructor` renders into the
git-ignored `_instructor-slides/`; open a deck there and press `s`.

## Rendering locally

The easy way is the repository's Docker environment, a replica of the CI job (see the
`Makefile`): `make dev` serves the decks at `http://localhost:4200` and re-renders a deck
whenever you save its source, reloading the browser tab; the rest of the site is at
`http://localhost:4000`. `make pdf` renders decks and PDFs, `make instructor` the build with
speaker notes, `make site` the whole production build.

Without Docker you need [Quarto](https://quarto.org/docs/get-started/) 1.10+, Python with
[`requirements.txt`](requirements.txt), and for PDFs Node plus a Chrome/Chromium:

```bash
# from the repository root
export QUARTO_PYTHON=/path/to/python            # the interpreter with requirements.txt installed
quarto preview slides                          # all decks at :4200, re-rendered on save
tools/build_slides.sh                          # all decks -> _site/slides/
tools/build_slides.sh --pdf                    # ...plus a PDF beside each deck
tools/build_slides.sh --instructor             # with speaker notes -> _instructor-slides/
```

The rendered decks live in `_site/slides/` next to Jekyll's output; `_config.yml` lists
`slides` under `keep_files` so `jekyll build` does not delete them, and excludes `slides/`
so Jekyll never touches the sources.

PDF export uses [decktape](https://github.com/astefanutti/decktape) (installed, or via
`npx`); it finds Chrome via `CHROME_PATH`, then `google-chrome`/`chromium` on `PATH`, then a
Playwright-installed Chromium (`pip install playwright && playwright install chromium`).
