#pragma once

#include <stddef.h>
#include <stdint.h>

typedef int in_int_t;
typedef int out_int_t;
typedef int inout_int_t;

#define NM 10


int spmv(in_int_t n, inout_int_t row[NM], inout_int_t col[NM], inout_int_t val[NM], inout_int_t vec[NM], inout_int_t out[NM]);
