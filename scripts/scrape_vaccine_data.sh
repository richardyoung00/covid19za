#!/bin/bash
cd "$(dirname "$0")"

git checkout provincial_vaccine_data

python3 sacoronavirus_provincial_vaccine.py

git checkout master

git add "data/covid19za_provincial_cumulative_timeline_vaccination.csv"

curr_date=$(date +%Y-%m-%d)

git commit -m "Scrape and update provincial vaccination data for $curr_date"

git push

git checkout provincial_vaccine_data