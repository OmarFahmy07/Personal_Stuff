#ifndef BIT_MATH_H
#define BIT_MATH_H

/* Sets bit number bit in variable var to 1	                */
#define SET_BIT(var, bit) var |= (1 << bit)

/* Sets bit number bit in variable var to 0	                */
#define CLR_BIT(var, bit) var &= ~(1 << bit)

/* Toggles bit number bit in variable var                   */
#define TOG_BIT(var, bit) var ^= (1 << bit)

/* Returns bit number bit in variable var 	                */
#define GET_BIT(var, bit) ((var >> bit) & 1)

/* Writes bit number bit in variable var with the value val */
#define WRITE_BIT(var, bit, val) var = (var & (~(1 << bit))) | (val << bit)

#endif