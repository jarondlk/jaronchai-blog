---
layout: page
title: Weblog
permalink: /weblog/
---

<p class="page-intro">
  Notes, project write-ups, technical walkthroughs
</p>

{% assign current_year = "" %}

<div class="weblog-record">
{% for post in site.posts %}
  {% unless post.path contains "template" %}
    {% assign post_year = post.date | date: "%Y" %}
    {% if post_year != current_year %}
      {% assign current_year = post_year %}
      <h2 class="weblog-year">{{ post_year }}</h2>
    {% endif %}

    <article class="weblog-entry">
      <time class="weblog-date" datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %-d" }}</time>
      <div>
        <h3 class="weblog-title">
          <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
        </h3>
      </div>
    </article>
  {% endunless %}
{% endfor %}
</div>
