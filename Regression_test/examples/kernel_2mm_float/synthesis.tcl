
set_project .
set_top_file kernel_2mm_float.cpp
synthesize -simple-buffers=true -verbose
#cdfg
write_hdl

exit



