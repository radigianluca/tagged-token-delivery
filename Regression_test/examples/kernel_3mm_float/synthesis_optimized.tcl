
set_project .
set_top_file kernel_3mm_float.cpp
synthesize -verbose
set_period 5
optimize -timeout=240
write_hdl

exit



