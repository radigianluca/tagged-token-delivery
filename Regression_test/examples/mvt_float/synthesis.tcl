
set_project .
set_top_file mvt_float.cpp
synthesize -simple-buffers=true -use-lsq=false -verbose
#cdfg
write_hdl

exit



