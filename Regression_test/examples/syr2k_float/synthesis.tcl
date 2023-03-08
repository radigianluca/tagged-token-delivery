
set_project .
set_top_file syr2k_float.cpp
synthesize -simple-buffers=true -use-lsq=true -verbose
#cdfg
write_hdl

exit



