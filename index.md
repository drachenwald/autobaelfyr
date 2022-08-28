---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
---

{% assign bpages = site.pages | where_exp: "item", "item.path contains 'baelfyr'" %}
{% assign issues = bpages | where: "name", "index.md" %}
{% for issue in issues %}
[{{ issue.month }}]({{ issue.dir }})
{% endfor %}
