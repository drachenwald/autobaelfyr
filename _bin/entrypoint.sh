#!/bin/bash

cd /build
curl -o _data/remote/regnum.json https://dis.drachenwald.sca.org/data/regnum-officers-box.json
curl https://dis.drachenwald-sca.org/data/calendar.json |  sed -e ':a' -e ' s/\\n\\n\\n//g; ta' | sed -e ':a' -e ' s/\\n/\<br \/\>/g; ta' > _data/remote/calendar.json 
curl -o _data/remote/groups.json https://dis.drachenwald.sca.org/data/regnum-groups.json
curl -L -o _data/remote/hamlets.csv https://docs.google.com/spreadsheets/d/e/2PACX-1vTwqFGCuJn7X5jEFJ9_qhMeGYm6B7QQ0JLipINvNUBHalXkQ_C8RlG9FIQtKlMPHr907dGla_Svpqw4/pub\?gid=0\&single=true\&output=csv
bundle install
bundle exec jekyll serve --watch --livereload --host 0.0.0.0