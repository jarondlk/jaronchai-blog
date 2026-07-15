---
layout: page
title: Writings
permalink: /writings/
---

<p class="page-intro">
  Research outputs, project notes, technical walkthroughs, and reflective updates.
</p>

{% assign research_outputs = site.data.research_outputs %}

{% if research_outputs.size > 0 %}
<section class="writings-section" aria-labelledby="writing-outputs">
  <p class="section-kicker">Research outputs</p>
  <h2 id="writing-outputs">Publications and thesis</h2>

  <ol class="output-list">
  {% for output in research_outputs %}
    <li class="output-item">
      <p class="output-type">{{ output.type }}</p>
      <div class="output-copy">
        <p class="output-status">{{ output.status }}</p>
        {% if output.url %}
        <a class="output-title" href="{{ output.url }}">{{ output.title }}</a>
        {% else %}
        <h3 class="output-title">{{ output.title }}</h3>
        {% endif %}
        <p class="output-meta">{{ output.institution }}</p>
        {% if output.note %}
        <p>{{ output.note }}</p>
        {% endif %}
      </div>
    </li>
  {% endfor %}
  </ol>
</section>
{% endif %}

<section class="writings-section" aria-labelledby="writing-notes">
  <p class="section-kicker">Notes archive</p>
  <h2 id="writing-notes">Notes and project writing</h2>

  {% assign current_year = "" %}

  <div class="weblog-record">
  {% for post in site.posts %}
    {% unless post.path contains "template" %}
      {% assign post_year = post.date | date: "%Y" %}
      {% if post_year != current_year %}
        {% assign current_year = post_year %}
        <h3 class="weblog-year">{{ post_year }}</h3>
      {% endif %}

      <article class="weblog-entry">
        <time class="weblog-date" datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %-d" }}</time>
        <div>
          <h4 class="weblog-title">
            <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
          </h4>
        </div>
      </article>
    {% endunless %}
  {% endfor %}
  </div>
</section>
