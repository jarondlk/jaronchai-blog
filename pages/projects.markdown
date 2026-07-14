---
layout: page
title: Projects
permalink: /projects/
---

<h1>Selected Projects</h1>

<div class="projects-grid">
  <div class="project-card">
    <div class="project-header">
      <div class="project-emoji">🧬</div>
      <h3 class="project-title">Plankton Classifier</h3>
    </div>
    <p class="project-desc">LLM-powered system for classifying plankton species from genomic and image data.</p>
  </div>

  <div class="project-card">
    <div class="project-header">
      <div class="project-emoji">🤖</div>
      <h3 class="project-title">RAG Chatbot</h3>
    </div>
    <p class="project-desc">Built a chatbot using vector DB, semantic search, and retrieval-augmented generation.</p>
  </div>

  <div class="project-card">
    <div class="project-header">
      <div class="project-emoji">📊</div>
      <h3 class="project-title">ETL Pipelines at IBM</h3>
    </div>
    <p class="project-desc">Designed Airflow jobs and migrated pipelines to BigQuery in production environments.</p>
  </div>

  <div class="project-card">
    <div class="project-header">
      <div class="project-emoji">🗂️</div>
      <h3 class="project-title">Life Dashboard</h3>
    </div>
    <p class="project-desc">A minimalist dashboard system in Obsidian powered by PARA and GTD.</p>
  </div>
</div>

<style>
.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
  gap: 1.5rem;
  margin-top: 2rem;
}

.project-card {
  background: #f9f9f9;
  border: 1px solid #ddd;
  border-radius: 0;
  padding: 1.5rem;
  text-decoration: none;
  color: inherit;
  box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  transition: transform 0.2s ease, box-shadow 0.2s ease, padding 0.2s ease;
}

.project-card:hover {
  transform: translateY(-4px) scale(1.015);
  box-shadow: 0 6px 16px rgba(0,0,0,0.1);
  padding: 1.7rem;
}

.project-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.project-emoji {
  font-size: 2rem;
}

.project-title {
  margin: 0;
}

.project-desc {
  font-size: 0.95rem;
  color: #444;
  margin-top: 0.5rem;
}
</style>
