#!/bin/bash
cd "$(dirname "$0")"

git checkout provincial_vaccine_data || exit 1;

python3 sacoronavirus_provincial_vaccine.py || exit 1;

git add "../data/covid19za_provincial_cumulative_timeline_vaccination.csv" || exit 1;

curr_date=$(date +%Y-%m-%d) || exit 1;

title="Scrape and update provincial vaccination data for $curr_date"
git commit -m "$title" || exit 1;

commit_hash=`git rev-parse HEAD` || exit 1;

git push || exit 1;

git checkout master || exit 1;

git cherry-pick $commit_hash || exit 1;

git push || exit 1;

# gh pr create --title "$title" --body "" || exit 1;

git checkout provincial_vaccine_data || exit 1;