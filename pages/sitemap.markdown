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
{% assign asset_files = site.static_files | where_exp: "file", "file.path contains '/assets/'" | sort: "path" %}
{% assign asset_count = asset_files | size %}
{% assign image_count = 0 %}
{% assign document_count = 0 %}
{% assign video_count = 0 %}
{% assign style_count = 0 %}
{% assign other_asset_count = 0 %}
{% assign document_asset_count = 0 %}
{% assign talk_asset_count = 0 %}
{% assign writing_image_asset_count = 0 %}
{% assign general_asset_count = 0 %}
{% assign image_exts = "|.jpg|.jpeg|.png|.gif|.webp|.svg|.heic|" %}
{% assign document_exts = "|.pdf|.doc|.docx|.ppt|.pptx|.xls|.xlsx|" %}
{% assign video_exts = "|.mp4|.mov|.webm|.m4v|" %}
{% assign style_exts = "|.css|.scss|" %}
{% for asset in asset_files %}
  {% assign asset_ext = asset.extname | downcase %}
  {% assign asset_ext_key = "|" | append: asset_ext | append: "|" %}
  {% if image_exts contains asset_ext_key %}
    {% assign image_count = image_count | plus: 1 %}
  {% elsif document_exts contains asset_ext_key %}
    {% assign document_count = document_count | plus: 1 %}
  {% elsif video_exts contains asset_ext_key %}
    {% assign video_count = video_count | plus: 1 %}
  {% elsif style_exts contains asset_ext_key %}
    {% assign style_count = style_count | plus: 1 %}
  {% else %}
    {% assign other_asset_count = other_asset_count | plus: 1 %}
  {% endif %}
  {% if asset.path contains "/assets/documents/" %}
    {% assign document_asset_count = document_asset_count | plus: 1 %}
  {% elsif asset.path contains "/assets/talks/" %}
    {% assign talk_asset_count = talk_asset_count | plus: 1 %}
  {% elsif asset.path contains "/assets/image/" %}
    {% assign writing_image_asset_count = writing_image_asset_count | plus: 1 %}
  {% else %}
    {% assign general_asset_count = general_asset_count | plus: 1 %}
  {% endif %}
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

<section class="sitemap-section metadata-design" aria-labelledby="metadata-design">
  <h2 id="metadata-design">Design Guide</h2>
  <div class="design-guide-grid">
    <div>
      <h3>Color</h3>
      <ul class="palette-list palette-list--compact">
        <li>
          <span class="palette-swatch" style="--swatch: #fffefd"></span>
          <div><strong>Paper</strong> <code>#fffefd</code><p>background</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #23201b"></span>
          <div><strong>Ink</strong> <code>#23201b</code><p>primary text</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #5f6970"></span>
          <div><strong>Muted</strong> <code>#5f6970</code><p>dates, notes, metadata</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #56B4E9"></span>
          <div><strong>Baby blue</strong> <code>#56B4E9</code><p>rules, focus, outgoing icons</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #dceff8"></span>
          <div><strong>Blue rule</strong> <code>#dceff8</code><p>quiet dividers</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #f3fbff"></span>
          <div><strong>Blue wash</strong> <code>#f3fbff</code><p>code background</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #247fae"></span>
          <div><strong>Blue ink</strong> <code>#247fae</code><p>high-contrast blue text</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #F6AA00"></span>
          <div><strong>Gold</strong> <code>#F6AA00</code><p>reserved accent</p></div>
        </li>
        <li>
          <span class="palette-swatch" style="--swatch: #00A785"></span>
          <div><strong>Green</strong> <code>#00A785</code><p>reserved accent</p></div>
        </li>
      </ul>
    </div>

    <div>
      <h3>Typography</h3>
      <div class="type-specimen-list type-specimen-list--compact">
        <article class="type-specimen type-specimen--serif">
          <p class="type-specimen__sample">Jaronchai Dilokkalayakul</p>
          <div>
            <h3>Literata</h3>
            <p>main titles; editorial texture</p>
          </div>
        </article>
        <article class="type-specimen type-specimen--sans">
          <p class="type-specimen__sample">Research data, talks, notes.</p>
          <div>
            <h3>IBM Plex Sans</h3>
            <p>body, navigation, interface</p>
          </div>
        </article>
        <article class="type-specimen type-specimen--mono">
          <p class="type-specimen__sample">_data/talks.yml · #56B4E9</p>
          <div>
            <h3>IBM Plex Mono</h3>
            <p>code, filenames, values</p>
          </div>
        </article>
      </div>
    </div>
  </div>
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
        <p>Fallback route for missing pages.</p>
      </div>
    </li>
  </ol>
</section>

<section class="sitemap-section metadata-assets" aria-labelledby="metadata-assets">
  <h2 id="metadata-assets">Asset Register</h2>
  <dl class="asset-summary-grid" aria-label="Asset summary">
    <div>
      <dt>{{ asset_count }}</dt>
      <dd>Total</dd>
    </div>
    <div>
      <dt>{{ image_count }}</dt>
      <dd>Images</dd>
    </div>
    <div>
      <dt>{{ document_count }}</dt>
      <dd>PDF / docs</dd>
    </div>
    <div>
      <dt>{{ video_count }}</dt>
      <dd>Video</dd>
    </div>
    {% if style_count > 0 %}
    <div>
      <dt>{{ style_count }}</dt>
      <dd>Styles</dd>
    </div>
    {% endif %}
    {% if other_asset_count > 0 %}
    <div>
      <dt>{{ other_asset_count }}</dt>
      <dd>Other</dd>
    </div>
    {% endif %}
  </dl>
  <p class="metadata-note">Files are grouped by source folder and generated during the Jekyll build.</p>

  <div class="asset-groups" aria-label="Grouped site assets">
    <details class="asset-group">
      <summary>
        <span>Documents</span>
        <small>{{ document_asset_count }} {% if document_asset_count == 1 %}file{% else %}files{% endif %}</small>
      </summary>
      <ol class="asset-list" aria-label="Document assets">
      {% for asset in asset_files %}
        {% if asset.path contains "/assets/documents/" %}
          <li>
            <span class="asset-kind">{{ asset.extname | remove_first: "." | upcase }}</span>
            <div class="asset-copy">
              <a href="{{ asset.path }}">{{ asset.path | remove_first: "/" }}</a>
            </div>
          </li>
        {% endif %}
      {% endfor %}
      </ol>
    </details>

    <details class="asset-group">
      <summary>
        <span>Talk Media</span>
        <small>{{ talk_asset_count }} {% if talk_asset_count == 1 %}file{% else %}files{% endif %}</small>
      </summary>
      <ol class="asset-list" aria-label="Talk media assets">
      {% for asset in asset_files %}
        {% if asset.path contains "/assets/talks/" %}
          <li>
            <span class="asset-kind">{{ asset.extname | remove_first: "." | upcase }}</span>
            <div class="asset-copy">
              <a href="{{ asset.path }}">{{ asset.path | remove_first: "/" }}</a>
            </div>
          </li>
        {% endif %}
      {% endfor %}
      </ol>
    </details>

    <details class="asset-group">
      <summary>
        <span>Writing Images</span>
        <small>{{ writing_image_asset_count }} {% if writing_image_asset_count == 1 %}file{% else %}files{% endif %}</small>
      </summary>
      <ol class="asset-list" aria-label="Writing image assets">
      {% for asset in asset_files %}
        {% if asset.path contains "/assets/image/" %}
          <li>
            <span class="asset-kind">{{ asset.extname | remove_first: "." | upcase }}</span>
            <div class="asset-copy">
              <a href="{{ asset.path }}">{{ asset.path | remove_first: "/" }}</a>
            </div>
          </li>
        {% endif %}
      {% endfor %}
      </ol>
    </details>

    {% if general_asset_count > 0 %}
    <details class="asset-group">
      <summary>
        <span>General Assets</span>
        <small>{{ general_asset_count }} {% if general_asset_count == 1 %}file{% else %}files{% endif %}</small>
      </summary>
      <ol class="asset-list" aria-label="General assets">
      {% for asset in asset_files %}
        {% unless asset.path contains "/assets/documents/" or asset.path contains "/assets/talks/" or asset.path contains "/assets/image/" %}
          <li>
            <span class="asset-kind">{{ asset.extname | remove_first: "." | upcase }}</span>
            <div class="asset-copy">
              <a href="{{ asset.path }}">{{ asset.path | remove_first: "/" }}</a>
            </div>
          </li>
        {% endunless %}
      {% endfor %}
      </ol>
    </details>
    {% endif %}
  </div>
</section>
