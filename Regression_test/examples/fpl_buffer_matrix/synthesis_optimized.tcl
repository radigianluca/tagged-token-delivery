
set_project .
set_top_file fpl_buffer_matrix.cpp
synthesize -verbose -use-lsq=false
set_period 4
optimize
write_hdl

exit



