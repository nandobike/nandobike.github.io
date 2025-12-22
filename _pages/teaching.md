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
  <!-- Display teaching collection without categories -->
  {% assign sorted_teaching = site.teaching | sort: "importance" %}
  
  <!-- Generate cards for each course -->
  {% if page.horizontal %}
    <div class="container">
      <div class="row row-cols-1 row-cols-md-2">
        {% for course in sorted_teaching %}
          {% include projects_horizontal.liquid project=course %}
        {% endfor %}
      </div>
    </div>
  {% else %}
    <div class="row row-cols-1 row-cols-md-3">
      {% for course in sorted_teaching %}
        {% include projects.liquid project=course %}
      {% endfor %}
    </div>
  {% endif %}
</div>