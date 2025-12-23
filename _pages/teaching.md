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
  
  <!-- DEBUG: Show course info -->
  <div style="background: #f0f0f0; padding: 10px; margin-bottom: 20px;">
    <h3>Debug Info:</h3>
    <p>Total courses: {{ sorted_teaching.size }}</p>
    {% for course in sorted_teaching %}
      <p>
        <strong>{{ course.title }}</strong><br>
        URL: {{ course.url }}<br>
        Path: {{ course.path }}<br>
      </p>
    {% endfor %}
  </div>
  
  <!-- Generate cards -->
  <div class="row row-cols-1 row-cols-md-3">
    {% for course in sorted_teaching %}
      {% include projects.liquid project=course %}
    {% endfor %}
  </div>
</div>