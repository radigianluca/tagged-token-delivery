typedef int inout_int_t;
typedef int out_int_t;


#define N 32
#define N_float 32.0
#define _N 1024
#define N_shift 5

int covariance(inout_int_t data[_N], out_int_t symmat [_N], out_int_t mean[N]);

//void covariance(inout_int_t data[30][30], out_int_t symmat [30][30], out_int_t mean[30]);