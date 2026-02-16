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

## Selected Writings

{%- include featured.html -%}

## Recent talks

{% assign talks_sorted = site.data.talks | sort: "date" | reverse %}

<ul class="talk-list">
{% for talk in talks_sorted limit: 5 %}
  {% assign links = talk.links %}

  <li class="talk-item">
    <div class="talk-row">
      <div class="talk-left">
        <div class="talk-title">{{ talk.title }}</div>
        <div class="talk-meta">
          {% if talk.event %}{{ talk.event }}{% endif %}
          {% if talk.date %}{% if talk.event %} · {% endif %}{{ talk.date }}{% endif %}
          {% if talk.location %}{% if talk.event or talk.date %} · {% endif %}{{ talk.location }}{% endif %}
        </div>
      </div>

      {% if links.slides or links.video or links.paper or links.abstract or links.poster %}
      <div class="talk-links">
        {% if links.slides %}<a class="talk-link" href="{{ links.slides }}">Slides</a>{% endif %}
        {% if links.video %}<a class="talk-link" href="{{ links.video }}">Video</a>{% endif %}
        {% if links.paper %}<a class="talk-link" href="{{ links.paper }}">Paper</a>{% endif %}
        {% if links.abstract %}<a class="talk-link" href="{{ links.abstract }}">Abstract</a>{% endif %}
        {% if links.poster %}<a class="talk-link" href="{{ links.poster }}">Poster</a>{% endif %}
      </div>
      {% endif %}
    </div>

    {% if talk.description or talk.images %}
    <details class="talk-details">
      <summary>Details</summary>

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
    </details>
    {% endif %}
  </li>
{% endfor %}
</ul>

<p class="talks-more"><a href="{{ '/talks' | relative_url }}">See all talks →</a></p>

## A Few of My Projects

{% include projects-section.html %}

&nbsp;

## FAQ

Frequently asked questions are loacted in [my "about" page](/about/#faqs)

## Get in Touch!

See [my "contact" page](/contact) \
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
