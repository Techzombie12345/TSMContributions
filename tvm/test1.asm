; dot product of two vectors
; floats are two 16 bit components,
; the first being a signed mantissa,
; the second being a signed exponent

; r0 = &v1
; r1 = v1.{ x, y, or z }
; r2 = &v2
; r3 = v2.{ x, y, or z }
; r4 = Lo
; r5 = Hi
; r6 = &products
; r7 = iterator

; load current component of vectors
mov v1,r0
mov v2,r2
mov products,r6
loadw r0,r1
loadw r2,r3

; perform multiplication and conditionally
; go through overflow routine
imul r1,r3,r5,r4
if r5
mov overflow,rf
add 4,r0,r0

mov end,rf

end:
mov end,rf

overflow:
move overflow,rf

; .data
v1:
byte 0x04, 0x00, 0x00, 0x00
byte 0x00, 0x00, 0x00, 0x00
byte 0x00, 0x00, 0x00, 0x00

v2:
byte 0x09, 0x00, 0x00, 0x00
byte 0x00, 0x00, 0x00, 0x00
byte 0x00, 0x00, 0x00, 0x00

products:
byte 0x00, 0x00, 0x00, 0x00
