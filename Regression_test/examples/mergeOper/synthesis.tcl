
set_project .
set_top_file mergeOper.cpp
synthesize -use-lsq=false -simple-buffers=true -verbose
#cdfg
write_hdl

exit



