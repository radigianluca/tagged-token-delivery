#pragma once

typedef float inout_float_t;
typedef float in_float_t;
typedef float out_float_t;

float cordic (in_float_t theta, in_float_t cordic_phase[1000], in_float_t current_cos, in_float_t current_sin);
