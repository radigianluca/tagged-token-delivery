
set_project .
set_top_file test_memory_12.cpp
synthesize -simple-buffers=true -verbose
#cdfg
write_hdl

exit



