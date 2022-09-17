curl -o _data/remote/regnum.json https://scripts.drachenwald.sca.org/json/regnum-officers-box.json
curl -o _data/remote/calendar.json https://scripts.drachenwald.sca.org/json/calendar.json
curl -o _data/remote/groups.json https://scripts.drachenwald.sca.org/json/regnum-groups.json
JEKYLL_ENV=production bundle exec jekyll build
