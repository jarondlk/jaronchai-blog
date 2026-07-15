---
layout: page
title: Talks
permalink: /talks/
---

{% assign talks_sorted = site.data.talks | sort: "date" | reverse %}
{% assign current_year = "" %}

<p class="page-intro">
  A record of past talks research presentations.
</p>

<div class="conference-record">
{% for talk in talks_sorted %}
  {% assign talk_year = talk.date | slice: 0, 4 %}
  {% if talk_year != current_year %}
    {% assign current_year = talk_year %}
    <h2 class="record-year">{{ talk_year }}</h2>
  {% endif %}
  {% assign links = talk.links %}

  <article class="talk-entry">
    <time class="talk-date" datetime="{{ talk.date }}">{{ talk.date | date: "%b %-d" }}</time>
    <div class="talk-body">
      <div class="talk-row">
        <div class="talk-left">
          <h3 class="talk-title">{{ talk.title }}</h3>
          <p class="talk-meta">
            {% if talk.event %}{{ talk.event }}{% if links.website %}<a class="talk-meta-link" href="{{ links.website }}" aria-label="{{ talk.event }} website"><span aria-hidden="true">↗</span></a>{% endif %}{% endif %}
            {% if talk.location %}{% if talk.event %} · {% endif %}{{ talk.location }}{% endif %}
          </p>

          {% if links.slides or links.video or links.paper or links.abstract or links.poster or links.award %}
          <div class="talk-links">
            {% if links.slides %}<a class="talk-link" href="{{ links.slides }}">Slides</a>{% endif %}
            {% if links.video %}<a class="talk-link" href="{{ links.video }}">Video</a>{% endif %}
            {% if links.paper %}<a class="talk-link" href="{{ links.paper }}">Paper</a>{% endif %}
            {% if links.abstract %}<a class="talk-link" href="{{ links.abstract }}">Abstract</a>{% endif %}
            {% if links.poster %}<a class="talk-link" href="{{ links.poster }}">Poster</a>{% endif %}
            {% if links.award %}<a class="talk-link" href="{{ links.award }}">Award</a>{% endif %}
          </div>
          {% endif %}
        </div>
      </div>

      {% if talk.description %}
      <p class="talk-desc">{{ talk.description }}</p>
      {% endif %}

      {% if talk.images %}
      <div class="talk-images">
        {% for img in talk.images %}
          <img
            src="{{ img | relative_url }}"
            alt="Image from {{ talk.title }}"
            loading="lazy">
        {% endfor %}
      </div>
      {% endif %}

      {% if talk.video %}
      <div class="talk-video">
        <video controls preload="metadata">
          <source src="{{ talk.video | relative_url }}" type="video/mp4">
          <a href="{{ talk.video | relative_url }}">Open video</a>
        </video>
      </div>
      {% endif %}
    </div>
  </article>
{% endfor %}
</div>
