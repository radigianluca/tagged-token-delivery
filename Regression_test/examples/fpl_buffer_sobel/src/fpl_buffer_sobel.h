typedef int in_int_t;
typedef int out_int_t;

#define NM 256

int fpl_buffer_sobel(in_int_t indata[NM], out_int_t outdata[NM], in_int_t GX[9], in_int_t GY[9]);
