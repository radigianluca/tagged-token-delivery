typedef int in_int_t;
typedef int out_int_t;
typedef int inout_int_t;

#define NI 10
#define NJ 10
#define NK 10
#define NL 10
#define N 10

#define S 1000

//#define SIZE 6

//int kernel_2mm(in_int_t feature[S], inout_int_t hist[S], inout_int_t B[S]);
int kernel_2mm(in_int_t alpha, in_int_t beta, inout_int_t tmp[N][N], in_int_t A[N][N], in_int_t B[N][N], in_int_t C[N][N], inout_int_t D[N][N]);
