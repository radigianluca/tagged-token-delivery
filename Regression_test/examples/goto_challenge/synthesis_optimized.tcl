
set_project .
set_top_file goto_challenge.cpp
synthesize -use-lsq=false -verbose
set_period 4
optimize 
write_hdl

exit



