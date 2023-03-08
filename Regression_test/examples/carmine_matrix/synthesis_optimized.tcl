
set_project .
set_top_file carmine_matrix.cpp
synthesize -verbose -use-lsq=false
set_period 4
optimize
write_hdl

exit



