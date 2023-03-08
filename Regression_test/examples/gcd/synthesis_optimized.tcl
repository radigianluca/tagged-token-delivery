
set_project .
set_top_file gcd.cpp
synthesize -use-lsq=false -verbose
set_period 4
optimize 
write_hdl

exit



