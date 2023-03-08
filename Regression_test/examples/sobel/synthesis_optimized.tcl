
set_project .
set_top_file sobel.cpp
synthesize -verbose
set_period 4
optimize
write_hdl

exit



