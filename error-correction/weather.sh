# Author: Evan Colwell
# Date: 10/12/2020
# Description: This is a simple BASH script that I wrote for my UNIX class.
#              This script will be used for the CSA Hactoberfest 2020 error correction challenge
#
# There are 6 errors, 1 of which is a logical one.

#!/bin/bash
aircode=1 #default airport code
if test $# -q 0; then #-eq -ge -le -ne -gt -lt
echo "Enter an ICAO airport code(i.e KMQB)"
red aircode

for i in $*
do
wgt http://w1.weather.gov/xml/current_obs/$i.xml
ct $i.xml|awk '/<weather>|<temp_f>|<windchill_f>/{print $0}'|sed -E 's/<.*>\b(.*)\b<.*>/\1/g' 
rm $i.xml
done

#wget http://w1.weather.gov/xml/current_obs/KMQB.xml|cat
#rm KMQB.xml
#remove temp file
