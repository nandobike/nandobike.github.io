---
layout: page
title: teaching
permalink: /teaching/
description: Materials for courses.
nav: true
nav_order: 4
horizontal: false
---

<!-- pages/teaching.md -->
<div class="teaching">
  {% assign sorted_teaching = site.teaching | sort: "importance" %}
  
  <div class="row row-cols-1 row-cols-md-3">
    {% for course in sorted_teaching %}
      {% assign project = course %}
      {% include projects.liquid %}
    {% endfor %}
  </div>
</div>
