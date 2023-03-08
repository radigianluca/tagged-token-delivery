
set_project .
set_top_file fpl_buffer_histogram.cpp
synthesize -use-lsq=true -verbose
set_period 4
optimize
write_hdl

exit



