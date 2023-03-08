
set_project .
set_top_file threshold.cpp
synthesize -use-lsq=true -simple-buffers=true -verbose
#cdfg
write_hdl

exit



