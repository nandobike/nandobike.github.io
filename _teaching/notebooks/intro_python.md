---
layout: page
title: "Research Methods Demo - Applied Research Course"
description: Interactive Jupyter notebook demonstrating research methodologies
permalink: /teaching/applied-research/notebooks/intro_python/
nav: false
---

# Introduction to Python Demo

📥 [Download Notebook](/assets/jupyter/intro_python.ipynb)

---

{::nomarkdown}
{% assign jupyter_path = 'assets/jupyter/intro_python.ipynb' | relative_url %}
{% capture notebook_exists %}{% file_exists assets/jupyter/intro_python.ipynb %}{% endcapture %}
{% if notebook_exists == 'true' %}
  {% jupyter_notebook jupyter_path %}
{% else %}
  <p>Sorry, the notebook you are looking for does not exist.</p>
{% endif %}
{:/nomarkdown}

---

[← Back to Applied Research Course](/teaching/applied_research_2026/)
