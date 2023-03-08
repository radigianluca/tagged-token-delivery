#!/bin/sh
#Authors: Andrea Guerrieri <andrea.guerrieri@epfl.ch> Ayatallah Elakhras <ayatallah.elakhras@epfl.ch>

export TODAY_IS=`date +%F%H%M%S`

#environment variables for gurobi
export GUROBI_HOME="/opt/gurobi951/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
#export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE=/opt/gurobi951/gurobi.lic


report_file=regression_test_detailed_$TODAY_IS.rpt
report=regression_test_$TODAY_IS.rpt

file=filelist.lst
clean="clean"

while IFS= read -r line
do
    if [ "$clean" = "$1" ]; then
    	echo "Clean-up" $line
    	rm $line/dynamatic_*
    	rm -r $line/hdl
    	rm -r $line/reports
    	rm -r $line/sim
    else
    	echo "Testing" $line
    	scripts/regression_test.sh $line $report $report_file
    fi
 
done < "$file"
