---
title: Jaronchai Dilokkalayakul
layout: default
---

{% assign talks_sorted = site.data.talks | sort: "date" | reverse %}
{% assign research_outputs = site.data.research_outputs %}
{% assign upcoming_conferences = site.data.upcoming_conferences | sort: "date_start" %}

<section class="home-issue" aria-labelledby="home-title">
  <div class="home-issue__copy">
    <p class="home-kicker">Incoming PhD Student (October 2026)</p>
    <h1 id="home-title">
      Jaronchai
      <span>Dilokkalayakul</span>
    </h1>
    <p class="home-deck">
      Data engineer and bioinformatics researcher, focusing on heterogeneous data integration.
    </p>

    <p class="home-context">
      Tohoku University, Sendai. From Bangkok, previously data engineer at IBM.
    </p>
  </div>

  <aside class="home-brief" aria-label="Current coordinates">
    <p class="home-brief__label">Current Affiliations</p>
    <dl>
      <div>
        <dt>Institute</dt>
        <dd>
          Tohoku University, Graduate School of Information Sciences (GSIS)<a class="affiliation-link" href="https://www.is.tohoku.ac.jp/en/" aria-label="Tohoku University Graduate School of Information Sciences website"><span aria-hidden="true">↗</span></a>
        </dd>
      </div>
      <div>
        <dt>Laboratory</dt>
        <dd>
          Information Biology Laboratory<a class="affiliation-link" href="https://www.bio.is.tohoku.ac.jp/en/" aria-label="Information Biology Laboratory website"><span aria-hidden="true">↗</span></a>
        </dd>
      </div>
      <div>
        <dt>Notes</dt>
        <dd>
          Affiliated with MEXT,
          ASPIRE<a class="affiliation-link" href="https://www.jst.go.jp/aspire/en/about_en.html" aria-label="ASPIRE website"><span aria-hidden="true">↗</span></a>,
          GP-EES<a class="affiliation-link" href="https://gp-ees.tohoku.ac.jp/en/" aria-label="GP-EES website"><span aria-hidden="true">↗</span></a>
        </dd>
      </div>
    </dl>
  </aside>
</section>

<section class="home-section home-section--focus" aria-labelledby="current-focus">
  <div class="focus-lead">
    <p class="section-kicker">Current focus</p>
    <h2 id="current-focus">Making biological monitoring data interoperable.</h2>
    <p>
      I work across bioinformatics, data infrastructure, and scientific workflow design,
      connecting scattered biological data so evidence is easier to reason with.
      <span class="focus-topics">AI and LLM <span aria-hidden="true">•</span> Data Infrastructure <span aria-hidden="true">•</span> Science Communication</span>
    </p>
  </div>
</section>

{% if research_outputs.size > 0 %}
<section class="home-section home-outputs" aria-labelledby="research-outputs">
  <div class="section-heading">
    <p class="section-kicker">Research</p>
    <h2 id="research-outputs">Publications</h2>
  </div>

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

{% if upcoming_conferences.size > 0 %}
<section class="home-section home-upcoming" aria-labelledby="upcoming-conferences">
  <div class="section-heading">
    <p class="section-kicker">Upcoming events</p>
    <h2 id="upcoming-conferences">Where I will be next</h2>
  </div>

  <ol class="upcoming-list">
  {% for conference in upcoming_conferences %}
    <li class="upcoming-item">
      <time class="upcoming-date" datetime="{{ conference.date_start }}">{{ conference.date_label }}</time>
      <div class="upcoming-copy">
        {% if conference.website %}
        <a class="upcoming-title" href="{{ conference.website }}">
          {{ conference.title }}<span aria-hidden="true">↗</span>
        </a>
        {% else %}
        <span class="upcoming-title">{{ conference.title }}</span>
        {% endif %}
        <p class="upcoming-meta">{{ conference.location }}</p>
        {% if conference.note %}
        <p>{{ conference.note }}</p>
        {% endif %}
      </div>
    </li>
  {% endfor %}
  </ol>
</section>
{% endif %}

<section class="home-section" aria-labelledby="recent-talks">
  <div class="section-heading section-heading--with-link">
    <div>
      <p class="section-kicker">Conference record</p>
      <h2 id="recent-talks">Recent talks</h2>
    </div>
    <a class="section-link" href="{{ '/talks' | relative_url }}">All talks</a>
  </div>

  <ol class="talk-list talk-list--compact">
  {% for talk in talks_sorted limit: 5 %}
    {% assign links = talk.links %}

    <li class="talk-item">
      <time class="talk-date" datetime="{{ talk.date }}">{{ talk.date | date: "%b %-d, %Y" }}</time>
      <div class="talk-body">
        <div class="talk-row">
          <div class="talk-left">
            <div class="talk-title">{{ talk.title }}</div>
            <div class="talk-meta">
              {% if talk.event %}{{ talk.event }}{% if links.website %}<a class="talk-meta-link" href="{{ links.website }}" aria-label="{{ talk.event }} website"><span aria-hidden="true">↗</span></a>{% endif %}{% endif %}
              {% if talk.location %}{% if talk.event %} · {% endif %}{{ talk.location }}{% endif %}
            </div>

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
      </div>
    </li>
  {% endfor %}
  </ol>
</section>

<section class="home-section home-archive" aria-labelledby="selected-work">
  <div class="section-heading section-heading--with-link">
    <div>
      <p class="section-kicker">Selected works</p>
      <h2 id="selected-work">Projects and research notes</h2>
    </div>
    <a class="section-link" href="{{ '/writings' | relative_url }}">All writing</a>
  </div>

  {% assign selected_urls = "" %}
  <ol class="editorial-list selected-works-list">
  {% for post in site.posts %}
    {% if post.project or post.featured == true %}
      {% assign post_key = post.url | append: "|" %}
      {% unless selected_urls contains post_key %}
      <li class="editorial-item">
        <time class="editorial-date" datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%b %Y" }}</time>
        <div class="editorial-copy">
          <a class="editorial-title" href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </div>
      </li>
      {% assign selected_urls = selected_urls | append: post_key %}
      {% endunless %}
    {% endif %}
  {% endfor %}
  </ol>
</section>
