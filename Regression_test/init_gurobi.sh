#environment variables for gurobi
export GUROBI_HOME="/opt/gurobi951/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
#export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"
export GRB_LICENSE_FILE=/opt/gurobi951/gurobi.lic
