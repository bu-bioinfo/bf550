---
title: "Labs"
permalink: /labs/
toc: true
toc_sticky: true
---

Every class meeting has a lab: the material you work through during working time, with instructors
and TAs in the room. Each one is a page, posted before its meeting and left up afterwards — work at
your own pace, and finish it after class if you do not get all the way through.

Nothing is submitted from a lab. A lab that produces something worth keeping feeds that unit's
problem set instead.

| Unit | Meeting | Lab |
|---:|---|---|
{% for lab in site.data.labs -%}
| {{ lab.unit | remove: "unit-" | plus: 0 }} | {{ lab.date }} | [{{ lab.title }}]({{ site.baseurl }}/labs/{{ lab.id }}/) |
{% endfor %}

Each unit's labs are also listed on that unit's page, under **In class**. The [schedule]({{ site.baseurl }}/schedule/)
links every meeting date to its lab once that lab is posted.
