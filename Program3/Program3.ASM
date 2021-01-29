; PROGRAM 3 -- READ SWITCHES AND DISPLAY VALUES IN LEDS
		
		ORG		$0000

R0		EQU		$00
R1		EQU		$01

START:	SEX		$01		; Set X register to 1
		GHI		R0		; Get HI bute of register 0 in D (which is 0; so this sets D=0)
		PHI		R1		; Put D in HI byte of register 1 (so R1=00xx)
		LDI		VAR		; Load D Immediately with address of VAR
		PLO		R1		; Put D in LOW half of R1 (so R1=0013)
		INP		4		; INP port 4 (front panel switches) & write to D and memory at (R1)
		OUT		4		; OUTput to port 4 (front panel LEDSs) contents of memory at (R1)
		LSQ				; Long Skip over next 2 instructions if Q=1...
		SEQ				; ...if Q was 0, then set Q=1
		SKP				; ...and SKIP next instructions
		REQ				; else Q was 1, so Reset Q=0
						; (At this point, D=the value read from the switches)
LOOP:	SMI		1		; Subtract Memory Immediately from D
		BNZ		LOOP	; Branch if Not Zero back to LOOP
		REQ				; Reset Q
		BR		START	; BRanch unconditionally back to START

VAR		DB		0		; Address used by INP and OUT for the switch and LED values

		END