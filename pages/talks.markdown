---
layout: page
title: Talks
permalink: /talks/
---

{% for talk in site.data.talks %}
<div class="talk-entry">
  <h3>{{ talk.title }}</h3>
  <p><strong>Event:</strong> {{ talk.event }}</p>
  <p><strong>Date:</strong> {{ talk.date }}</p>
  <p><strong>Location:</strong> {{ talk.location }}</p>
  <p><strong>Abstract:</strong> {{ talk.abstract }}</p>

  <p>
    {% if talk.slides %}<a href="{{ talk.slides }}">Slides</a>{% endif %}
    {% if talk.video %}{% if talk.slides %} | {% endif %}<a href="{{ talk.video }}">Video</a>{% endif %}
    {% if talk.paper %}{% if talk.video or talk.slides %} | {% endif %}<a href="{{ talk.paper }}">Paper</a>{% endif %}
  </p>

  {% if talk.images %}
  <div class="talk-images">
    {% for img in talk.images %}
      <img src="{{ img }}" alt="Image from {{ talk.title }}" style="max-width: 300px; margin: 5px;">
    {% endfor %}
  </div>
  {% endif %}

  <hr>
</div>
{% endfor %}
