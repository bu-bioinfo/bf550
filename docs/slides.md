---
title: "Slides"
permalink: /slides/
---

Every lecture deck, as it is posted — one per meeting that has a lecture. Each deck is a web
page — arrow keys move between slides, `f` goes full screen, `m` opens a slide menu — and a PDF
for offline reading. The decks assume the unit's reading; they put its ideas to work rather than
repeating them.

| Unit | Meeting | Deck | | |
|---|---|---|---|---|
{% for deck in site.data.slides -%}
| {{ deck.unit | remove: "unit-" | plus: 0 }} | {{ deck.date }} | {{ deck.title }} | [view]({{ site.baseurl }}/slides/{{ deck.file }}.html) | [PDF]({{ site.baseurl }}/slides/{{ deck.file }}.pdf) |
{% endfor %}

Decks are authored in the site's [GitHub repository](https://github.com/bu-cds-bf550/bu-cds-bf550.github.io/tree/main/slides) and rebuilt on every change.
