
set_project .
set_top_file gemm.cpp
synthesize -use-lsq=true -verbose
set_period 4.0
optimize -timeout=60
write_hdl

exit



