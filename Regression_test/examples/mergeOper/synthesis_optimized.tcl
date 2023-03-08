
set_project .
set_top_file mergeOper.cpp
synthesize -use-lsq=false -verbose
optimize -timeout=60
write_hdl

exit



