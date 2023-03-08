typedef float in_float_t;
typedef float out_float_t;
typedef float inout_float_t;

typedef int in_int_t;
typedef int inout_int_t;

#define NI 8
#define NJ 8
#define NK 8
#define NL 8
#define N 8
#define N_shift 3
#define _N 64

int kernel_2mm(in_int_t alpha, in_int_t beta, inout_int_t tmp[_N], in_int_t A[_N], in_int_t B[_N], in_int_t C[_N], inout_int_t D[_N]);
