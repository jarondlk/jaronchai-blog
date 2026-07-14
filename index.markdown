---
title: Jaronchai Dilokkalayakul
layout: default
---

{% assign talks_sorted = site.data.talks | sort: "date" | reverse %}

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
        <dd>Tohoku University, Graduate School of Information Sciences (GSIS)</dd>
      </div>
      <div>
        <dt>Laboratory</dt>
        <dd>Information Biology Laboratory</dd>
      </div>
      <div>
        <dt>Notes</dt>
        <dd>Affiliated with MEXT, GP-EES, ASPIRE</dd>
      </div>
    </dl>
  </aside>
</section>

<section class="home-section home-section--focus" aria-labelledby="current-focus">
  <p class="section-kicker">Current focus</p>
  <h2 id="current-focus">Making biological monitoring data interoperatable.</h2>
  <p>
    I work on bioinformatics, data platforms, and scientific workflows enhancement.
    Connect scattered biological data and make the evidence easier to reason with.
  </p>
  <div class="focus-grid">
    <div>
      <h3>AI and LLM</h3>
      <p>Large Language Models, multimodal models, RAG.</p>
    </div>
    <div>
      <h3>Data Infrastructure</h3>
      <p>Batch, streaming, storage, monitoring.</p>
    </div>
    <div>
      <h3>Science Communication</h3>
      <p>Talks, presentation, posters.</p>
    </div>
  </div>
  <p class="home-note">
    Peripherals: coffees, productivity tools, note takings and stationaries.
  </p>
</section>

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
              {% if talk.event %}{{ talk.event }}{% endif %}
              {% if talk.location %}{% if talk.event %} · {% endif %}{{ talk.location }}{% endif %}
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
    <a class="section-link" href="{{ '/weblog' | relative_url }}">All writing</a>
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

<section class="home-section home-index" aria-label="Personal index">
  <nav class="index-links" aria-label="Personal index">
    <a href="{{ '/about' | relative_url }}">About</a>
    <a href="{{ '/now' | relative_url }}">Now</a>
    <a href="{{ '/uses' | relative_url }}">Uses</a>
    <a href="{{ '/resume' | relative_url }}">Resume</a>
    <a href="mailto:jaron.dilok@gmail.com">Email</a>
    <a href="https://www.linkedin.com/in/jaronchai/">LinkedIn</a>
  </nav>
</section>
