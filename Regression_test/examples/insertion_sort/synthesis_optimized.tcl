
set_project .
set_top_file insertion_sort.cpp
synthesize -use-lsq=true -verbose
set_period 5
optimize
write_hdl

exit



