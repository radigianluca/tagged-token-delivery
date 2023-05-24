#!/bin/sh
#Authors: Andrea Guerrieri andrea.guerrieri@epfl.ch Ayatallah Elakhras ayatallah.elakhras@epfl.ch

#export TODAY_IS=`date +%F%H%M%S`

#report_file=regression_test_detailed_$TODAY_IS.rpt
#report=regression_test_$TODAY_IS.rpt

report=$2
report_file=$3

workingdir=`pwd`


#Exits wrapper
#report () 
#{
#  printf "$(date)\t$1\t$2\n" >> log.csv
#}
#
#printf "Date\tOperation\tResult\n" >> log.csv

echo "" >> $workingdir/$report_file	
echo "" >> $workingdir/$report_file
echo "**************************************************" >> $workingdir/$report_file
date >> $workingdir/$report_file

testcase=$1

echo "****Executing test case $testcase ****" >> $workingdir/$report_file
#Wo optimization
#sh scripts/execute.sh $testcase $workingdir/$report >> $workingdir/$report_file
#sh scripts/check.sh $testcase $workingdir/$report >> $workingdir/$report_file

#echo "****Executing test case $testcase optimized ****" >> $report_file
#With optimization
sh scripts/execute.sh $testcase $workingdir/$report optimized >> $report_file
sh scripts/check.sh $testcase $workingdir/$report optimized >> $report_file

#report "Execution" $result

