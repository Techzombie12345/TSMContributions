; contributed by Texedo
; 16 float multiplication function v0.1(experimental)
; float fltMultiply( float x, float y )

; input params
; stack[0] = floatSM16SE16, x
; stack[4] = floatSM16SE16, y
; rc = stack frame, not strictly a
;   pointer to return address pointer

; returns the multiplication
; product as a float, by way of
; ra being the signed mantissa
; rb being the signed exponent

; rd = return stack

; types:
; float
; two 16 bit signed components:
;      mantissa,   exponent
; byte 0x00, 0x00, 0x00, 0x00
;
; x.expo, x.lo, x.hi, y.expo, y.lo, y.hi, stack iterator


fltMultiply:
  push rc
  mov re,rd
  mov fltMultiplyStackFrame,rc
  mov fltMultiplyLocalStack,re
  pushw r0
  pushw r1
  pushw r2
  pushw r3
  pushw r4
  pushw r5
  ; todo: literally everything else

  mov fltMultiplyLocalStack,re

fltMultiplyStackFrame:
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
fltMultiplyLocalStack:

( 0b0010 * 2^2 ) * ( 0b0010 * 2^2 ) = 64
0b0100 * 2^4
0100_0000
