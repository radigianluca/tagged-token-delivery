
set_project .
set_top_file bicg_float.cpp
synthesize -use-lsq=false -verbose
optimize -period=4 -timeout=240
write_hdl

exit



