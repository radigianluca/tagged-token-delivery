
set_project .
set_top_file gemver.cpp
set_period 4.0
synthesize -use-lsq=true -verbose
optimize -timeout=60
write_hdl

exit



