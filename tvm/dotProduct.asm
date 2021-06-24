; contributed by Texedo
; dot product function v0.1(experimental)
; float dot( vec4 * vector1, vec4 * vector2 )

; input params
; ra = vec4 pointer, v0
; rb = vec4 pointer, v1

; returns the dot product as a float, by way of
; ra being the signed mantissa
; rb being the signed exponent

; rd = return stack

; types:
; float
; two 16 bit signed components:
;      mantissa,   exponent
; byte 0x00, 0x00, 0x00, 0x00
;
; vec4 ( four component( floats ) vector )
; X    mantissa,   exponent
; byte 0x00, 0x00, 0x00, 0x00
; Y
; byte 0x00, 0x00, 0x00, 0x00
; Z
; byte 0x00, 0x00, 0x00, 0x00
; W
; byte 0x00, 0x00, 0x00, 0x00


dot:
  ; set up localStack
  mov re,rd
  mov dotLocalStack,re
  pushw r0 ; v0.mantissa
  pushw r1 ; v1.mantissa
  pushw r2 ; prodIterator
  pushw r3 ; Lo
  pushw r4 ; Hi
  pushw r5 ; loopIterator
  ; set proIterator
  mov componentProduct,r2
  ; clear r5
  xor r5,r5,r5
dotLoop1:
  loadw ra,r0
  loadw rb,r1
  imul r0,r1,r4,r3
  ; just pray you're not performing any
  ; operations that require overflow calculation
  add 4,ra,ra
  add 4,rb,rb
  storew r3,r2
  add 4,r2,r2
  add 1,r5,r5
  ifl r5,4
  mov dotLoop1,rf
  mov componentProduct,r2
  xor r0,r0,r0
  xor r1,r1,r1
  xor r5,r5,r5
dotLoop2:
  loadw r2,r1
  add r1,r0,r0
  add 4,r2,r2
  add 1,r5,r5
  ifl r5,4
  mov dotLoop2,rf
  mov r0,ra
  ; Temporarily assumes exponent equals 0
  xor rb,rb,rb

  popw r5
  popw r4
  popw r3
  popw r2
  popw r1
  mov rd,re
  popw rf

; .data

  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
dotLocalStack:

componentProduct:
;      mantissa,   exponent
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
  byte 0x00, 0x00, 0x00, 0x00
