
set_project .
set_top_file mvt_float.cpp
synthesize -use-lsq=false -verbose
set_period 5
optimize -timeout=240
write_hdl

exit



