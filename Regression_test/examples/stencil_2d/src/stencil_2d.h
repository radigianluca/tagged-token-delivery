typedef int in_int_t;
typedef int out_int_t;

#define N 300
#define N_filter 10
#define LOOP_ITER 28

#define EXTRA 30

int stencil_2d (in_int_t orig[900], out_int_t sol[900], in_int_t filter[10]);
