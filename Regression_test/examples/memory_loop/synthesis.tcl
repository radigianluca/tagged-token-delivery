
set_project .
set_top_file memory_loop.cpp
synthesize -use-lsq=true -simple-buffers=true -verbose
#cdfg
write_hdl

exit



