#!/bin/bash

cd /build
curl -o _data/remote/regnum.json https://scripts.drachenwald.sca.org/json/regnum-officers-box.json
curl -o _data/remote/calendar.json https://scripts.drachenwald.sca.org/json/calendar.json
curl -o _data/remote/groups.json https://scripts.drachenwald.sca.org/json/regnum-groups.json
bundle install
bundle exec jekyll serve --watch --livereload --host 0.0.0.0