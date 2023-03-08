
set_project .
set_top_file image_resize.cpp
synthesize -use-lsq=true -verbose
optimize
write_hdl

exit



