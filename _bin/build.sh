curl -o _data/remote/regnum.json https://scripts.drachenwald.sca.org/json/regnum-officers-box.json
curl https://scripts.drachenwald.sca.org/json/calendar.json |  sed -e ':a' -e ' s/\\n\\n\\n//g; ta' | sed -e ':a' -e ' s/\\n/\<br \/\>/g; ta' > _data/remote/calendar.json 
curl -o _data/remote/groups.json https://scripts.drachenwald.sca.org/json/regnum-groups.json
JEKYLL_ENV=production bundle exec jekyll build
