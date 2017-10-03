---
layout: archive
title: "Índice"
permalink: /sitemap/
author_profile: false
---

Encuentra rápidamente lo que buscas.

<h2 style="color: blue">Páginas</h2>
{% for post in site.pages %}
  {% if post.indexable %}
    {% include archive-single.html %}
  {% endif %}
{% endfor %}

<h2 style="color: blue">Posts</h2>
{% for post in site.posts %}
  {% include archive-single.html %}
{% endfor %}

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
{% unless collection.output == false or collection.label == "posts" %}
  {% capture label %}{{ collection.label }}{% endcapture %}
  {% if label != written_label %}
  <h2>{{ label }}</h2>
  {% capture written_label %}{{ label }}{% endcapture %}
  {% endif %}
{% endunless %}
{% for post in collection.docs %}
  {% unless collection.output == false or collection.label == "posts" %}
  {% include archive-single.html %}
  {% endunless %}
{% endfor %}
{% endfor %}