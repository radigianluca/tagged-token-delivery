#pragma once

#include <stddef.h>
#include <stdint.h>

#define NTRU_N 100

typedef uint32_t out_int_t; 
typedef uint32_t in_int_t;


int polynMult (out_int_t r[NTRU_N], in_int_t a[NTRU_N], in_int_t b[NTRU_N]);
