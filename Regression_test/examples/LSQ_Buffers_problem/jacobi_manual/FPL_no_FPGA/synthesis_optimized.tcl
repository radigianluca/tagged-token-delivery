
set_project .
set_top_file jacobi_1d_imper.cpp
set_period 4
synthesize -use-lsq=true -verbose
optimize -timeout=60
write_hdl

exit



