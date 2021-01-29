; PROGRAM 1 -- BLINK Q FAST
		
		ORG		$0000

		SEQ				; Set Q		
		REQ				; Reset Q
		BR		$00		; Repeat Forever

		END