; PROGRAM 2 -- BLINK Q SLOW
		
		ORG		$0000

R2		EQU		$02

START:	LDI		$49		; LOAD 0x49
		PHI		R2		; Put it in the HI half of register 2
LOOP:	DEC		R2		; Decrement register 2
		GHI		R2		; Get the HI half of register 2
		BNZ		LOOP	; Branch if Not Zero
		LSQ				; Long Skip over next 2 instructions if Q=1...
		SEQ				; ...if Q was 0, then SEt Q=1
		SKP				; ...and SKIP next instruction
		REQ				; ekse Q was 1, so REset Q=0
		BR		START	; BRanch unconditionally back to START

		END