---
title: "Labs"
permalink: /labs/
toc: true
toc_sticky: true
---

Every class meeting has a lab: the material you work through during working time, with instructors
and TAs in the room. Work at your own pace, and finish one after class if you do not get all the
way through.

The first lab is a page on this site — it sets up your toolchain, and it ends by cloning the one
thing you need for the rest. **Every lab after it is a Jupyter notebook in the public
[labs repository](https://github.com/bu-cds-bf550/bf550-labs).** Clone it once, at the start of
the term, and `git pull` when we tell you there is something new: your own edits and experiments
stay where you left them, and a fix we push reaches you on your next pull. Break these notebooks
freely — changing a line to see what happens is the point of them.

Nothing is submitted from a lab. A lab that produces something worth keeping feeds that unit's
problem set instead.

| Unit | Meeting | Lab |
|---:|---|---|
{% for lab in site.data.labs -%}
| {{ lab.unit | remove: "unit-" | plus: 0 }} | {{ lab.date }} | [{{ lab.title }}]({% if lab.path %}{{ site.labs_repo }}/blob/main/{{ lab.path }}{% else %}{{ site.baseurl }}/labs/{{ lab.id }}/{% endif %}) |
{% endfor %}

Each unit's labs are also listed on that unit's page, under **In class**. The [schedule]({{ site.baseurl }}/schedule/)
links every meeting date to its lab once that lab is posted.
