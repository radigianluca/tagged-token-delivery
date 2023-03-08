
set_project .
set_top_file fpl_buffer_sobel.cpp
synthesize -verbose
set_period 4
optimize
write_hdl

exit



