
set_project .
set_top_file atax_float.cpp
synthesize -use-lsq=false -verbose
set_period 5
optimize -timeout=120
write_hdl

exit



