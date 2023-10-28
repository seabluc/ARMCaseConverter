src		DCB		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 0
dst		DCB		0, 	0, 	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0
		
		MOV		R0, #0  ; Counter to traverse src
		LDR		R3, =src ; Load the address of src arr into R3
		LDR		R4, =dst ; Load the address of dst arr into R4
loop
		LDRB		R1, [R3, R0]  ; Load a byte from src at index R0 into R1 ... SYNTAX: LDRB Rd, [Rs1, Rs2]
		CMP		R1, #0  ; If src[r0] == 0, branch to break
		BEQ		break
		SUB		R2, R1, #32  ; Convert lowercase char to uppercase by subtracting #20 from its ASCII value, store converted char into R2
		STRB		R2, [R4, R0]  ; Store the capitalized char (R2) into dst (R4) ... SYNTAX: STR Rs, [Rd, index]
		ADD		R0, R0, #1  ; counter++ to load next byte from src
		B		loop
break
		end
