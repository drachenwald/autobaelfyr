# Automatic Baelfyr

This repo generates issues of the Baelfyr, the Principality Newsletter of
Insuale Draconis in the Society for Creative Anachronism (SCA). It uses
[Jekyll](https://jekyllrb.com) and [PagedJS](https://pagedjs.org) to
generate HTML and CSS that renders as if printed on A4 paper, and prints
to PDF well for that format.

## Getting Started

The easiest way to start Jekyll and see the results is to install
[Docker](https://www.docker.com).

With the Docker service running, change to the topmost directory in the
repository and run

```
docker-compose up
```

If you do not have Docker, you can execute the commands in `entrypoint.sh`,
other than `cd /build`.

## Creating an issue

An issue requires a number of files and directories to take shape.

### Articles directory

Articles are held in a directory of the format `_issues/YYYY-MM/`. They
should be in markdown format, and begin with the three lines:

```
---
title: INSERT TITLE HERE
---
```

with the markdown itself appearing from the fourth line onward.

They will be included in the issue after the table of contents, in
alphabetical order of filename. It's recommended that each filename
is of the format `NNN-title-of-article.md` where NNN is a three digit
number that indicates where in the order it should appear.

Only markdown files should be placed in this directory – don't place
images or other assets here.

### Assets directory

The bare minimum issue requires a directory of the format
`baelfyr/YYYY-MM/`, containing a file called `index.md` with the contents:

```
---
issue: YYYY-MM
anno: YEAR IN A.S. FORMAT
volume: VOLUME NUMBER
month: "MONTH AND YEAR IN HUMAN READABLE FORMAT"
layout: baelfyr
credits:
  cover: "PHOTO CREDIT TO APPEAR AFTER TABLE OF CONTENTS"
---
```

The rest of this file should be blank.

There should also be a file called "cover.jpg" which is an image in
portrait format, to appear on the cover.

Images and other assets may be placed here. When including them in the
articles, give the URL using the `{% link %}` tag to the _source_ file
in the repo, e.g.

```
![Image from assets dir]({% link baelfyr/2020-10/thing.jpg %})
```

When Jekyll runs, it will translate the `{% link %}` tag to the ultimate
destination of that file.

### Generating an issue

You may preview the issue in HTML format (but closely emulating the PDF)
at `http://localhost:4000/baelfyr/YYYY-MM/`, substituting the issue date
for `YYYY-MM`.

At this time, there is no automated workflow for generating PDFs, but you
may use the Print to PDF function of your browser.

Page numbers in the table of contents do not currently work in Safari.
