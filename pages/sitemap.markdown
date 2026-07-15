---
layout: page
title: Sitemap
permalink: /sitemap/
---

<section class="sitemap-section" aria-labelledby="sitemap-relations">
  <h2 id="sitemap-relations">Relations</h2>
  <div class="sitemap-network" aria-label="Main site relationships">
    <a class="sitemap-node sitemap-node--root" href="{{ '/' | relative_url }}">Home<span>entry point</span></a>
    <span class="sitemap-arrow" aria-hidden="true">connects to</span>
    <a class="sitemap-node" href="{{ '/about/' | relative_url }}">About<span>identity</span></a>
    <a class="sitemap-node" href="{{ '/resume/' | relative_url }}">Resume<span>formal record</span></a>
    <a class="sitemap-node" href="{{ '/writings/' | relative_url }}">Writings<span>outputs and notes</span></a>
    <a class="sitemap-node" href="{{ '/talks/' | relative_url }}">Talks<span>presentations</span></a>
    <a class="sitemap-node" href="{{ '/now/' | relative_url }}">Now<span>current state</span></a>
    <a class="sitemap-node" href="{{ '/uses/' | relative_url }}">Uses<span>tools</span></a>
  </div>
</section>

<section class="sitemap-section" aria-labelledby="sitemap-pages">
  <h2 id="sitemap-pages">Pages</h2>
  <ol class="sitemap-list">
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
      <span class="sitemap-date">Tools</span>
      <div class="sitemap-copy">
        <a href="{{ '/uses/' | relative_url }}">Uses</a>
        <p>Hardware, software, services, and working setup notes.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Older</span>
      <div class="sitemap-copy">
        <a href="{{ '/projects/' | relative_url }}">Projects</a>
        <p>Older project index kept visible for reference.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Contact</span>
      <div class="sitemap-copy">
        <a href="{{ '/contact/' | relative_url }}">Contact</a>
        <p>Email and profile links.</p>
      </div>
    </li>
    <li>
      <span class="sitemap-date">Index</span>
      <div class="sitemap-copy">
        <a href="{{ '/sitemap/' | relative_url }}">Sitemap</a>
        <p>This structural index.</p>
      </div>
    </li>
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
  {% assign talks_sorted = site.data.talks | sort: "date" | reverse %}
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
