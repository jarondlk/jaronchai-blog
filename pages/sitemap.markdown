---
layout: page
title: Metadata
permalink: /sitemap/
---

{% assign public_page_count = 7 %}
{% assign utility_count = 3 %}
{% assign talks_sorted = site.data.talks | sort: "date" | reverse %}
{% assign talk_count = talks_sorted | size %}
{% assign research_output_count = site.data.research_outputs | size %}
{% assign upcoming_count = site.data.upcoming_conferences | size %}
{% assign note_count = 0 %}
{% for post in site.posts %}
  {% unless post.path contains "template" %}
    {% assign note_count = note_count | plus: 1 %}
  {% endunless %}
{% endfor %}

<p class="page-intro">
  A live site overview for content counts and route checking.
</p>

<section class="sitemap-section metadata-section" aria-labelledby="metadata-overview">
  <h2 id="metadata-overview">Overview</h2>
  <dl class="metadata-grid" aria-label="Site metadata summary">
    <div>
      <dt>{{ public_page_count }}</dt>
      <dd>Pages</dd>
    </div>
    <div>
      <dt>{{ talk_count }}</dt>
      <dd>Talk records</dd>
    </div>
    <div>
      <dt>{{ research_output_count }}</dt>
      <dd>Research outputs</dd>
    </div>
    <div>
      <dt>{{ note_count }}</dt>
      <dd>Writing notes</dd>
    </div>
    <div>
      <dt>{{ upcoming_count }}</dt>
      <dd>Upcoming</dd>
    </div>
    <div>
      <dt>{{ utility_count }}</dt>
      <dd>Utility routes</dd>
    </div>
  </dl>
  <p class="metadata-note">Counts are generated from the route list, posts, and data files during the Jekyll build.</p>
</section>

<section class="sitemap-section" aria-labelledby="sitemap-pages">
  <h2 id="sitemap-pages">Pages</h2>
  <ol class="sitemap-list sitemap-list--pages">
    <li>
      <span class="sitemap-date">Home</span>
      <div class="sitemap-copy">
        <a href="{{ '/' | relative_url }}">Jaronchai Dilokkalayakul</a>
        <p>Homepage, current focus, recent talks, and selected work.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Profile</span>
      <div class="sitemap-copy">
        <a href="{{ '/about/' | relative_url }}">About</a>
        <p>Bio, research coordinates, work style, timeline, and personal context.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Writing</span>
      <div class="sitemap-copy">
        <a href="{{ '/writings/' | relative_url }}">Writings</a>
        <p>Research outputs, project notes, technical walkthroughs, and reflective updates.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Talks</span>
      <div class="sitemap-copy">
        <a href="{{ '/talks/' | relative_url }}">Talks</a>
        <p>Conference talks, posters, slides, images, and video records.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">CV</span>
      <div class="sitemap-copy">
        <a href="{{ '/resume/' | relative_url }}">Resume</a>
        <p>Experience, education, awards, and formal academic/professional history.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Current</span>
      <div class="sitemap-copy">
        <a href="{{ '/now/' | relative_url }}">Now</a>
        <p>Current location, current work, and near-term focus.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Index</span>
      <div class="sitemap-copy">
        <a href="{{ '/sitemap/' | relative_url }}">Metadata</a>
        <p>Live site overview, route index, and content counts.</p>
      </div>
    </li>
  </ol>
</section>

<section class="sitemap-section" aria-labelledby="sitemap-outputs">
  <h2 id="sitemap-outputs">Research Outputs</h2>
  <ol class="sitemap-list">
  {% for output in site.data.research_outputs %}
    <li>
      <span class="sitemap-date">{{ output.type }}</span>
      <div class="sitemap-copy">
        {% if output.url %}
        <a href="{{ output.url }}">{{ output.title }}</a>
        {% else %}
        <span class="sitemap-title">{{ output.title }}</span>
        {% endif %}
        <p>{{ output.status }}{% if output.institution %} · {{ output.institution }}{% endif %}</p>
      </div>
    </li>
  {% endfor %}
  </ol>
</section>

<section class="sitemap-section" aria-labelledby="sitemap-posts">
  <h2 id="sitemap-posts">Writing Archive</h2>
  {% assign current_year = "" %}
  <ol class="sitemap-list">
  {% for post in site.posts %}
    {% unless post.path contains "template" %}
      {% assign post_year = post.date | date: "%Y" %}
      <li>
        <time class="sitemap-date" datetime="{{ post.date | date_to_xmlschema }}">
          {% if post_year != current_year %}
            {% assign current_year = post_year %}
            {{ post_year }}
          {% else %}
            {{ post.date | date: "%b %-d" }}
          {% endif %}
        </time>
        <div class="sitemap-copy">
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
          <p>{{ post.date | date: "%B %-d, %Y" }}</p>
        </div>
      </li>
    {% endunless %}
  {% endfor %}
  </ol>
</section>

<section class="sitemap-section" aria-labelledby="sitemap-talks">
  <h2 id="sitemap-talks">Talk Records</h2>
  <ol class="sitemap-list">
  {% for talk in talks_sorted %}
    <li>
      <time class="sitemap-date" datetime="{{ talk.date }}">{{ talk.date | date: "%Y" }}</time>
      <div class="sitemap-copy">
        <a href="{{ '/talks/' | relative_url }}">{{ talk.title }}</a>
        <p>
          {% if talk.event %}{{ talk.event }}{% endif %}
          {% if talk.location %}{% if talk.event %} · {% endif %}{{ talk.location }}{% endif %}
        </p>
      </div>
    </li>
  {% endfor %}
  </ol>
</section>

<section class="sitemap-section" aria-labelledby="sitemap-utility">
  <h2 id="sitemap-utility">Utility</h2>
  <ol class="sitemap-list">
    <li>
      <span class="sitemap-date">Redirect</span>
      <div class="sitemap-copy">
        <a href="{{ '/weblog/' | relative_url }}">Weblog</a>
        <p>Compatibility route that forwards readers to Writings.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Feed</span>
      <div class="sitemap-copy">
        <a href="{{ '/feed.xml' | relative_url }}">RSS Feed</a>
        <p>Generated feed for writing updates.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Error</span>
      <div class="sitemap-copy">
        <a href="{{ '/404.html' | relative_url }}">404 Page</a>
        <p>Fallback page for missing routes.</p>
      </div>
    </li>
  </ol>
</section>
