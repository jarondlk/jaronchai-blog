---
layout: page
title: Talks
permalink: /talks/
---
## Talks & Presentations

{% for talk in site.data.talks %}
<div class="talk-entry">
  <h3>{{ talk.title }}</h3>
  <p><strong>Event:</strong> {{ talk.event }}</p>
  <p><strong>Date:</strong> {{ talk.date }}</p>
  <p><strong>Location:</strong> {{ talk.location }}</p>
  <p>{{ talk.description }}</p>

  {% assign links = talk.links %}
  {% if links.slides or links.video or links.paper or links.abstract or links.poster %}
    <p>
      {% if links.slides %}<a href="{{ links.slides }}">Slides</a>{% endif %}
      {% if links.video %}{% if links.slides %} | {% endif %}<a href="{{ links.video }}">Video</a>{% endif %}
      {% if links.paper %}{% if links.video or links.slides %} | {% endif %}<a href="{{ links.paper }}">Paper</a>{% endif %}
      {% if links.abstract %}{% if links.paper or links.video or links.slides %} | {% endif %}<a href="{{ links.abstract }}">Abstract</a>{% endif %}
      {% if links.poster %}{% if links.abstract or links.paper or links.video or links.slides %} | {% endif %}<a href="{{ links.poster }}">Poster</a>{% endif %}
    </p>
  {% endif %}

  {% if talk.images %}
  <div class="talk-images">
    {% for img in talk.images %}
      <img src="{{ site.baseurl }}/{{ img }}" alt="Image from {{ talk.title }}" style="max-width: 300px; margin: 5px;">
    {% endfor %}
  </div>
  {% endif %}

  <hr>
</div>
{% endfor %}
