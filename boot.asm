	ORG	$0000
boot:
	;Set stack location in memory to the very top of our 32k RAM
	LD	SP,		$FFFF	;set stackpoionter to FFFF
	
	;Configure serial comunication
	LD	HL,		$4003	;Address of 3 in UART chip (LCR register)
	LD	DE,		$4001	;Address of 0 in UART chip (I/O byte, or divisor latch high byte)
	LD	BC,		$4000	;Address of 1 in UART chip (IER register, or divisor latch low byte)
	
	LD	(HL), 		$80	;activate DLAB
	
	LD	A,		24	;set 24 as the divisor for serial clock
	LD	(BC),	 	A	;since we are using a 1.8432mhz clockrate
	XOR	A			;and that we want to clock at 4800 baud 
	LD	(DE), 		A	;

	LD	(HL), 		$1A	;set serial to 7bit 1bit stop even parity, deactivate DLAB


