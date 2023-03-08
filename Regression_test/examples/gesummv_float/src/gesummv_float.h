typedef float in_float_t;
typedef float out_float_t;
typedef float inout_float_t;

typedef int in_int_t;
typedef int out_int_t;
typedef int inout_int_t;

int gesummv_float(in_int_t alpha, in_int_t beta, in_int_t A[30][30], in_int_t B[30][30], out_int_t tmp[30], out_int_t y[30] , in_int_t x[30]);
