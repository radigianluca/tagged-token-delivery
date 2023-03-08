
set_project .
set_top_file image_resize.cpp
synthesize -use-lsq=true -simple-buffers=true -verbose
#cdfg
write_hdl

exit



