
set_project .
set_top_file gesummv_float.cpp
synthesize -use-lsq=true -verbose
set_period 4
optimize -timeout=120
write_hdl

exit



