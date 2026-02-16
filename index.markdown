---
title: Jaronchai Blog
layout: default
---

# Jaronchai Dilokkalayakul

## Me in 10 seconds

I’ve been a [data engineer](https://ibm.com), a [researcher](https://www.is.tohoku.ac.jp/en/), and I like to [talk](/talks) all about it.\
I’m a coffee drinker, media enjoyer, and I love a being a [dog on the internet](https://alfyn.page) sometimes.\
[Bangkok](https://maps.app.goo.gl/Rrm5AFaLUZ42k3GG6) native, I now live in [Sendai, Japan](https://maps.app.goo.gl/HHWvrCXHT9ouUT4T9).

## Me in 10 minutes

See [my "about" page](/about)

## What am I doing now?

See [my "now" page](/now)

## Tools I use?

See [my "uses" page](/uses)

## Contact me

See [my "contact" page](/contact) \
Or [send me an email!](mailto:jaron.dilok@gmail.com) I check my email often!

## Selected Writings

{%- include featured.html -%}

## Some of my recent talks

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
      <img src="{{ site.baseurl }}/{{ img }}" alt="Image from {{ talk.title }}" style="max-width: 600px; margin: 5px;">
    {% endfor %}
  </div>
  {% endif %}

  <hr>
</div>
{% endfor %}

## A Few of My Projects

{% include projects-section.html %}

&nbsp;

## FAQ

Frequently asked questions are loacted in [my "about" page](/about/#faqs)

## Get in Touch!

Work E-mail: [jaron.dilok@gmail.com][mail]  
University E-mail: [dilokkalayakul.jaronchai.p8@dc.tohoku.ac.jp][unimail]  
Links: [Github][github], [LinkedIn][linkedin], [Instagram][insta]

<!-- Reference -->
[mail]: mailto:jaron.dilok@gmail.com
[unimail]: mailto:dilokkalayakul.jaronchai.p8@dc.tohoku.ac.jp

[github]: https://github.com/jarondlk
[linkedin]: https://www.linkedin.com/in/jaronchai/
[insta]: https://instagram.com/jarondlk?igshid=YmMyMTA2M2Y=

Have an awesome day!
