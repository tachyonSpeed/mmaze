#include "lm3s.h"

.macro FUNC_DECL name
	.thumb_func
	.global \name
\name:
.endm

.macro FUNC_START name
	.func     \name
	FUNC_DECL \name
.endm

.macro vector name
	.if (. - __vectors < _VECTORS_SIZE)
	.weak \name
	.set  \name, __bad_interrupt
	.long \name
	.endif
.endm

	.section .isr_vector,"ax",%progbits
	.func   __vectors
	.global __vectors
__vectors:
	.long _estack
	.long  __vector_1 // this is purposely not weak
	vector __vector_2
	vector __vector_3
	vector __vector_4
	vector __vector_5
	vector __vector_6
	vector __vector_7
	vector __vector_8
	vector __vector_9
	vector __vector_10
	vector __vector_11
	vector __vector_12
	vector __vector_13
	vector __vector_14
	vector __vector_15
	vector __vector_16
	vector __vector_17
	vector __vector_18
	vector __vector_19
	vector __vector_20
	vector __vector_21
	vector __vector_22
	vector __vector_23
	vector __vector_24
	vector __vector_25
	vector __vector_26
	vector __vector_27
	vector __vector_28
	vector __vector_29
	vector __vector_30
	vector __vector_31
	vector __vector_32
	vector __vector_33
	vector __vector_34
	vector __vector_35
	vector __vector_36
	vector __vector_37
	vector __vector_38
	vector __vector_39
	vector __vector_40
	vector __vector_41
	vector __vector_42
	vector __vector_43
	vector __vector_44
	vector __vector_45
	vector __vector_46
	vector __vector_47
	vector __vector_48
	vector __vector_49
	vector __vector_50
	vector __vector_51
	vector __vector_52
	vector __vector_53
	vector __vector_54
	vector __vector_55
	vector __vector_56
	vector __vector_57
	vector __vector_58
	vector __vector_59
	vector __vector_60
	vector __vector_61
	vector __vector_62
	vector __vector_63
	.endfunc

	.text

	.weak __bad_interrupt
	.set  __bad_interrupt, __vector_1

	.section .init0,"ax",%progbits
	.weak      __vector_1
	FUNC_DECL  __vector_1
	FUNC_START __init
	b __init
	.endfunc

