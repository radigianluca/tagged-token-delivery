
set_project .
set_top_file complexdiv.cpp
synthesize -use-lsq=false -verbose
optimize
write_hdl

exit



