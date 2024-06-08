---
layout: categories
icon: fas fa-stream
order: 1
---

{% assign sorted_categories = site.categories | sort %}
{% for category in sorted_categories %}
  {% assign category_name = category | first %}
  {% assign posts = category | last %}
  <h2 id="{{ category_name | slugify }}" class="archive__subtitle">{{ category_name }}</h2>
  <ul class="archive__posts">
    {% for post in posts %}
      <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
        <small>{{ post.date | date_to_string }}</small>
      </li>
    {% endfor %}
  </ul>
{% endfor %}
