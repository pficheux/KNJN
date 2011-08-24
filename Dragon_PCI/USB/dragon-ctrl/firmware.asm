; ***************************************************************************
;   Disclaimer: this code is based on reverse engineering from the dragon's
;    software from the dragon's board available at http://www.fpga4fun.com
; ***************************************************************************

; This requires as31 to compile: http://www.pjrc.com/tech/8051/


; FSR special registers
.equ	ckcon,     0x8e
.equ	mpage,     0x92


; EZ-USB registers

; Endpoint 0-7 Data Buffers
.equ	out7buf,   0x7b40
.equ    in7buf,    0x7b80
.equ	out6buf,   0x7bc0
.equ    in6buf,    0x7c00
.equ	out5buf,   0x7c40
.equ    in5buf,    0x7c80
.equ	out4buf,   0x7cc0
.equ    in4buf,    0x7d00
.equ	out3buf,   0x7d40
.equ    in3buf,    0x7d80
.equ	out2buf,   0x7dc0
.equ    in2buf,    0x7e00
.equ	out1buf,   0x7e40
.equ    in1buf,    0x7e80
.equ	out0buf,   0x7ec0
.equ    in0buf,    0x7f00


; Isochronous Data
.equ	out8data,  0x7f60
.equ	out9data,  0x7f61
.equ	out10data, 0x7f62
.equ	out11data, 0x7f63
.equ	out12data, 0x7f64
.equ	out13data, 0x7f65
.equ	out14data, 0x7f66
.equ	out15data, 0x7f67

.equ	in8data,   0x7f68
.equ	in9data,   0x7f69
.equ	in10data,  0x7f6a
.equ	in11data,  0x7f6b
.equ	in12data,  0x7f6c
.equ	in13data,  0x7f6d
.equ	in14data,  0x7f6e
.equ	in15data,  0x7f6f


; Isochronous Byte Counts
.equ	out8bch,   0x7f70
.equ	out8bcl,   0x7f71
.equ	out9bch,   0x7f72
.equ	out9bcl,   0x7f73
.equ	out10bch,  0x7f74
.equ	out10bcl,  0x7f75
.equ	out11bch,  0x7f76
.equ	out11bcl,  0x7f77
.equ	out12bch,  0x7f78
.equ	out12bcl,  0x7f79
.equ	out13bch,  0x7f7a
.equ	out13bcl,  0x7f7b
.equ	out14bch,  0x7f7c
.equ	out14bcl,  0x7f7d
.equ	out15bch,  0x7f7e
.equ	out15bcl,  0x7f7f


; CPU Registers
.equ	cpucs,     0x7f92
.equ	portacfg,  0x7f93
.equ	portbcfg,  0x7f94
.equ    portccfg,  0x7f95


; Input-Output Port Registers
.equ	outa,      0x7f96
.equ	outb,      0x7f97
.equ	outc,      0x7f98

.equ	pinsa,     0x7f99
.equ	pinsb,     0x7f9a
.equ	pinsc,     0x7f9b

.equ	oea,       0x7f9c
.equ	oeb,       0x7f9d
.equ	oec,       0x7f9e


; Isochronous Control/Status Registers
.equ	isoerr,    0x7fa0
.equ	isoctl,    0x7fa1
.equ    zbcout,    0x7fa2


; i2c Registers
.equ	i2cs,      0x7fa5
.equ    i2dat,     0x7fa6


; Interrupts
.equ    ivec,      0x7fa8
.equ	in07irq,   0x7fa9
.equ	out07irq,  0x7faa
.equ	usbirq,    0x7fab
.equ	in07ien,   0x7fac
.equ	out07ien,  0x7fad
.equ	usbien,    0x7fae
.equ	usbbav,    0x7faf

.equ	bpaddrh,   0x7fb2
.equ	bpaddrl,   0x7fb3


; Bulk Endpoints 0-7
.equ	ep0cs,     0x7fb4
.equ	in0bc,     0x7fb5
.equ    in1cs,     0x7fb6
.equ	in1bc,     0x7fb7
.equ    in2cs,     0x7fb8
.equ	in2bc,     0x7fb9
.equ    in3cs,     0x7fba
.equ	in3bc,     0x7fbb
.equ    in4cs,     0x7fbc
.equ	in4bc,     0x7fbd
.equ    in5cs,     0x7fbe
.equ	in5bc,     0x7fbf
.equ    in6cs,     0x7fc0
.equ	in6bc,     0x7fc1
.equ    in7cs,     0x7fc2
.equ	in7bc,     0x7fc3

.equ	out0cs,    0x7fc4
.equ	out0bc,    0x7fc5
.equ    out1cs,    0x7fc6
.equ	out1bc,    0x7fc7
.equ    out2cs,    0x7fc8
.equ	out2bc,    0x7fc9
.equ    out3cs,    0x7fca
.equ	out3bc,    0x7fcb
.equ    out4cs,    0x7fcc
.equ	out4bc,    0x7fcd
.equ    out5cs,    0x7fce
.equ	out5bc,    0x7fcf
.equ    out6cs,    0x7fd0
.equ	out6bc,    0x7fd1
.equ    out7cs,    0x7fd2
.equ	out7bc,    0x7fd3


; Global USB Registers
.equ	sudptrh,   0x7fd4
.equ	sudptrl,   0x7fd5
.equ	usbcs,     0x7fd6
.equ    togctl,    0x7fd7
.equ    usbframel, 0x7fd8
.equ    usbframeh, 0x7fd9

.equ    fnaddr,    0x7fdb

.equ    usbpair,   0x7fdd
.equ    in07val,   0x7fde
.equ    out07val,  0x7fdf
.equ    inisoval,  0x7fe0
.equ	outisoval, 0x7fe1
.equ	fastxfr,   0x7fe2
.equ	autoptrh,  0x7fe3
.equ	autoptrl,  0x7fe4
.equ	autodata,  0x7fe5


; Setup Data
.equ	setupdat,  0x7fe8


; Isochronous FIFO Sizes
.equ	out8addr,  0x7ff0
.equ    out9addr,  0x7ff1
.equ    out10addr, 0x7ff2
.equ    out11addr, 0x7ff3
.equ    out12addr, 0x7ff4
.equ    out13addr, 0x7ff5
.equ    out14addr, 0x7ff6
.equ    out15addr, 0x7ff7
.equ	in8addr,   0x7ff8
.equ    in9addr,   0x7ff9
.equ    in10addr,  0x7ffa
.equ    in11addr,  0x7ffb
.equ    in12addr,  0x7ffc
.equ    in13addr,  0x7ffd
.equ    in14addr,  0x7ffe
.equ    in15addr,  0x7fff



.org	0

start:
	mov	sp, #0x2f

	; Enables USB
	mov	dptr, #usbcs
	mov	a, #4
	movx	@dptr, a

	; Prepares the activation of M1/CS (puts FPGA in Slave mode, and disables the flash)
	mov	dptr, #outc
	mov	a, #1
	movx	@dptr, a
	
	; Outputs for /INIT, PROG and M1/CS
	mov	dptr, #oec
	mov	a, #0xcf
	movx	@dptr, a
	
	; Keeps M1/CS, and puts PROG to 1
	mov	dptr, #outc
	mov	a, #0x41
	movx	@dptr, a
	
	; Disables FASTXFR
	mov	dptr, #fastxfr
	clr	a
	movx	@dptr, a

	; Builds the flash init sequence:
	; 00 00 00 00  FF 00 80 80 - 00 00 00 00  00 00 00 00
	; 00 00 00 00  00 00 00 00 - 00 00 00 00  00 00 00 00
	; which will send these current bytes to the flash:
	; 0b000000, meaning "FAST_READ", from address 0. Note that
	; in the protocol, there's one dummy byte missing...
	acall	Set_AutoPTR
	acall	Build_InitData
	
	; Enables FWR#
	mov	dptr, #portacfg
	mov	a, #0x10
	movx	@dptr, a
	
	; Enables FBLK
	mov	dptr, #fastxfr
	mov	a, #0x40
	movx	@dptr, a
	
	; Desactivates M1/CS (puts FPGA in Master mode)
	mov	dptr, #outc
	mov	a, #0x40
	movx	@dptr, a
	

	acall	Set_AutoPTR
	
	; Sends the init sequence
	mov	r0, #32
init_loop:	
	movx	a, @dptr
	djnz	r0, init_loop
	
	; Disables FWR#
	mov	dptr, #portacfg
	clr	a
	movx	@dptr, a
	
	; Strobes /INIT to 1
	mov	dptr, #outc
	mov	a, #0xc0
	movx	@dptr, a
	
	; Strobes /INIT down to Z
	mov	dptr, #oec
	mov	a, #0x4f
	movx	@dptr, a

	; Wait for the DONE pin from the FPGA.
	; Phoenix hack:
	; Let's timeout after a while, so that
	; we can go into the USB pool, even if the
	; fpga didn't configure correctly (bad
	; program for example)
	; Waits for up to 8000000 loops, which would
	; mean something's like 100000000 cycles, or
	; at 24mhz, about 4 seconds.
	mov	r2, #200
wait_init_outer2:
	mov	r1, #200
wait_init_outer:
	mov	r0, #200
wait_init:
	mov	dptr, #pinsc
	movx	a, @dptr
	jb	acc.5, fpga_inited
	djnz	r0, wait_init
	djnz	r1, wait_init_outer
	djnz	r2, wait_init_outer2

fpga_inited:
	; Put M1/CS back to 1
	mov	dptr, #outc
	mov	a, #0x41
	movx	@dptr, a
	

; FPGA is initialized (or at least, we timeouted waiting
; for it to initialize), let's prepare the cypress chip
; now to recieve and act as the true USB chip it is.
	

	; Activates doublebuffering for EP4
	mov	dptr, #usbpair
	mov	a, #0x10
	movx	@dptr, a
	
	; Activates FRD# and FRW#
	mov	dptr, #portacfg
	mov	a, #0x30
	movx	@dptr, a
	
	; Activates FBLK
	mov	dptr, #fastxfr
	mov	a, #0x40
	movx	@dptr, a
	
	; No stretch value
	clr	a
	mov	ckcon, a

; ------------------ ;

; Main USB loop. Will keep the an2135 busy waiting
; for commands on the endpoints 2, 4 and 6.

USB_Loop:
	mov	dptr, #out2cs
	movx	a, @dptr
	jb	acc.1, EP2_Busy
	acall	Poll_EP2

EP2_Busy:	
	mov	dptr, #out4cs
	movx	a, @dptr
	jb	acc.1, EP4_Busy
	acall	Poll_EP4

EP4_Busy:
	mov	dptr, #out6cs
	movx	a, @dptr
	jb	acc.1, EP6_Busy
	acall	Poll_EP6

EP6_Busy:

	sjmp	USB_Loop


; Functions used by the startup sequence to initialise
; the boot up of the SPI-Flash onboard.
Set_AutoPTR:
	mov	dptr, #autoptrh
	mov	a, #0x10
	movx	@dptr, a
	inc	dptr
	mov	a, #0
	movx	@dptr, a
	inc	dptr
	ret

Build_InitData:
	clr	a
	movx	@dptr, a
	movx	@dptr, a
	movx	@dptr, a
	movx	@dptr, a
	mov	a, #0xff
	movx	@dptr, a
	clr	a
	movx	@dptr, a
	mov	a, #0x80
	movx	@dptr, a
	movx	@dptr, a
	clr	a
	mov	r0, #0x18
loop_build:
	movx	@dptr, a
	djnz	r0, loop_build
	ret

; ------------------ ;

; This waits for data from EP2, and forwards it to the fpga,
; straight, using the FASTXFR method
; Phoenix hack: may be slightly slower than the original's
; Dragon method, but I don't want to hack it the dragon's way ;-)
Poll_EP2:
	mov	dptr, #out2bc
	movx	a, @dptr
	
	jz	E2_return

	mov	r0, a
	
	mov	dptr, #autoptrh
	mov	a, #0x7d	; 0x7dc0 = out2buf
	movx	@dptr, a
	inc	dptr
	mov	a, #0xc0
	movx	@dptr, a
	inc	dptr

EP2_Copy:
	movx	a, @dptr
	djnz	r0, EP2_Copy
	
	mov	dptr, #out2bc
	movx	@dptr, a

E2_return:	
	ret

; ------------------ ;

; This waits for I2C commands. Dragon protocol.
; Note: this was rewritten from scratch, based on the
; protocol description, and the cypress i2c docs.
; Protocol: first byte = number of block. A block
; starts with a byte "size", then is followed by an
; i2c address byte (with the direction bit that is),
; and then:
;   -) if direction bit is set (that is, read request)
;      then size is the size of the buffer we want to
;      read from the i2c device, and the block ends
;      right after the address.
;   -) if direction bit is clear (that is, write request)
;      then size is the size of the buffer we want to
;      write to the i2c device, INCLUDING the address
;      byte, and data ends the block.
; As a reply, we have to send back a byte reply per block
; followed optionally by the readed data block. The byte
; reply has the following format:
; Bit 7: BERR bit from I2CS
; Bit 6: ACK bit from I2CS
; Bits 5-0: number of bytes read or written.

; Notes for algo:
;   r0 contains the input buffer pointer (out4buf = 0x7cc0)
;   r1 contains the output buffer pointer (in4buf = 0x7d00)
;   r2 contains the number of block
;   r3 contains the current block's size, which will be decremented
;   r4 contains the i2c device address
;   r5 is the current block reply (ie, the size)
;   r6 is the last i2cs register after a done
;   r7 is a boolean telling we don't want to halt on no-ack.
; 0x21 is the pointer on the current output buffer reply byte
; psw.1 is a boolean telling if the last command got an error
; 0x20 used for temp purpose by one function

Poll_EP4:
	mov	r0, #0xc0
	mov	r1, #0x00
	mov	0x21, #0x00
	mov	dptr, #out4bc
	movx	a, @dptr
	jz	e4_got_zero_request
	acall	ep4_read_in	; reads the number of blocks
	mov	r2, a

i2c_processing_loop:
	mov	r7, #0		; enables fails on non-ack on each loop
	
	acall	ep4_read_in	; reads the current block's size
	mov	r3, a
	mov	r5, a
	
	acall	ep4_read_in	; reads the current block's device address
	mov	r4, a
	
	acall	wait_i2c_stop	; let's initiates i2c transfert
	acall	start_i2c
	
	acall	ep4_write_out	; prepares one byte for the return status
	
	mov	a, r4		; checks direction bit
	jb	acc.0, _j_i2c_read_request
	acall	i2c_write_request
	djnz	r2, i2c_processing_loop
	sjmp	e4_return
_j_i2c_read_request:
	acall	i2c_read_request
	djnz	r2, i2c_processing_loop

e4_return:
	mov	dptr, #in4bc	; everything's done, let's send usb packet back
	mov	a, r1
	movx	@dptr, a
e4_got_zero_request:
	clr	a
	mov	dptr, #out4bc
	movx	@dptr, a
	ret

; Helper function to read input ep4 buffer
ep4_read_in:
	mov	mpage, #0x7c
	movx	a, @r0
	inc	r0
	ret

; Helper function to write output ep4 buffer
ep4_write_out:
	mov	mpage, #0x7d
	movx	@r1, a
	inc	r1
	ret

; Starts i2c bus
start_i2c:
	mov	dptr, #i2cs
	mov	a, #0x80
	movx	@dptr, a
	ret

; Stop i2c functions
i2c_stop:
	mov	dptr, #i2cs
	mov	a, 0x40
	movx	@dptr, a
	ret

; Waits i2c bus to be stopped
wait_i2c_stop:
	mov	dptr, #i2cs
loop_wait_i2c_stop:
	movx	a, @dptr
	jb	acc.6, loop_wait_i2c_stop
	ret

; Waits for i2c command to process, returns status into
; r6, and sets psw.1 to 1 if an error is detected
; r7 to true means that we don't check for non-ack error
wait_i2c_done:
	mov	dptr, #i2cs
loop_wait_i2c_done:
	movx	a, @dptr
	jnb	acc.0, loop_wait_i2c_done
	mov	r6, a
	jb	acc.2, wait_i2c_has_error
	jb	acc.1, wait_i2c_no_error
	mov	a, r7
	jz	wait_i2c_has_error
wait_i2c_no_error:
	anl	psw, #0xfd
	ret
	
wait_i2c_has_error:
	setb	psw.1
	ret

; Initiates lastrd
i2c_lastrd:
	mov	dptr, #i2cs
	movx	a, @dptr
	setb	acc.5
	movx	@dptr, a
	ret

; Rewind to status byte, and updates it. If it's an error, just don't
; put r1 back, in order to flush anything read
i2c_write_status_byte:
	jb	psw.1, write_status_error
	mov	0x20, r1
	mov	r1, 0x21
	mov	a, r5
	setb	acc.6
	acall	ep4_write_out
	mov	r1, 0x20
	mov	0x21, r1
	ret

write_status_error:
	mov	a, r6
	mov	r1, 0x21
	inc	0x21
	rl	a
	rl	a
	rl	a
	rl	a
	rl	a
	anl	a, #0xc0
	acall	ep4_write_out
	ret

; Subfunction to handle an i2c read request
; Won't handle zero-read requests properly...
i2c_read_request:
	mov	a, r3
	jz	has_zero_read	; this is bad...
	mov	dptr, #i2dat	; write address on i2c bus
	mov	a, r4
	movx	@dptr, a
	acall	wait_i2c_done
	jb	psw.1, got_i2c_read_error
	mov	r7, #0xff
	anl	psw, #0x20
	dec	r3
	mov	a, r3

	; if there's only one read, let's enable lastrd bit straight
	jnz	i2c_read_more_than_one_byte
	setb	psw.5
	acall	i2c_lastrd

i2c_read_more_than_one_byte:

	mov	dptr, #i2dat	; this read is to initiate i2c bus on the an2135
	movx	a, @dptr	; and the result can be trashed away
	acall	wait_i2c_done
	jb	psw.1, got_i2c_read_error
	jb	psw.5, i2c_read_one_byte

	dec	r3
	mov	a, r3		; skip the loop if we have only two bytes
	jz	i2c_read_two_bytes
	
loop_i2c_read:
	mov	dptr, #i2dat
	movx	a, @dptr
	acall	ep4_write_out
	acall	wait_i2c_done
	jb	psw.1, got_i2c_read_error
	djnz	r3, loop_i2c_read

i2c_read_two_bytes:
	acall	i2c_lastrd	; this is the second to last byte read, we have
				; to enable lastrd before doing it.
	
	mov	dptr, #i2dat
	movx	a, @dptr
	acall	ep4_write_out
	acall	wait_i2c_done
	jb	psw.1, got_i2c_read_error

i2c_read_one_byte:	
	acall	i2c_stop	; in order to read the last byte, we have to
				; stop the i2c bus; last byte will be available
				; straight after the stop.
	
	mov	dptr, #i2dat
	movx	a, @dptr
	acall	ep4_write_out
	acall	i2c_write_status_byte
	ret

got_i2c_read_error:
	acall	i2c_write_status_byte
	acall	i2c_stop
	ret

has_zero_read:
	mov	r6, #0
	anl	psw, #0xfd
	acall	i2c_write_status_byte
	acall	i2c_stop
	ret

; Subfunction to handle an i2c write request
i2c_write_request:
	dec	r3
	mov	dptr, #i2dat
	mov	a, r4
	movx	@dptr, a
	acall	wait_i2c_done
	jb	psw.1, got_i2c_write_error
	
	mov	a, r3		; a zero-byte write request is possible
				; if we only want to probe a device.
	jz	i2c_write_finish
	
loop_i2c_write:
	acall	ep4_read_in
	mov	dptr, #i2dat
	movx	@dptr, a
	acall	wait_i2c_done
	jb	psw.1, got_i2c_write_error
	djnz	r3, loop_i2c_write

i2c_write_finish:

got_i2c_write_error:
	acall	i2c_write_status_byte
	acall	i2c_stop
	ret

; ------------------ ;

; This will be used by Poll_EP6 when reading data from the FPGA
; to forward to the USB endpoint 4. Note that it's the same than
; for EP2.
Write_EP4:
	mov	a, r0
	push	acc
	
	mov	dptr, #in4cs

Wait_EP4_Not_Busy:
	movx	a, @dptr
	jb	acc.1, Wait_EP4_Not_Busy
	
	mov	dptr, #autoptrh
	mov	a, #0x7d	; 0x7d00 = in4buf
	movx	@dptr, a
	inc	dptr
	mov	a, #0
	movx	@dptr, a
	inc	dptr

EP4_Copy:
	movx	@dptr, a
	djnz	r0, EP4_Copy
	
	pop	acc
	mov	r0, a
	
	mov	dptr, #in4bc
	movx	@dptr, a
	ret


; This waits for commands from EP6
Poll_EP6:
	mov	dptr, #out6bc
	movx	a, @dptr
	jnz	EP6_HasBytes
; If the software doesn't send anything, we put M1/CS on Z, keeping only
; the /PROG line active. Dragon way. Phoenix way is rather sending a
; single 0x4e byte.
	mov	dptr, #oec
	mov	a, #0x4e
	movx	@dptr, a
	jnz	EP6_return
	
EP6_HasBytes:
	mov	r7, a
	djnz	r7, has_more_than_1_byte
; If the software sends only one byte, it's interpreted as a special
; command for the Dragon: it sends it to the C port, and forwards its
; status back to EP6.

; Phoenix hack inside: if bit 1 is set, forward that to the oec register.
; that pin is unused anyway.

	mov	dptr, #out6buf
	movx	a, @dptr
	
	jb	acc.1, to_oec
	
	mov	dptr, #outc
	sjmp	continue_ep6
to_oec:
	mov	dptr, #oec
continue_ep6:
	movx	@dptr, a
	mov	dptr, #pinsc
	movx	a, @dptr
	mov	dptr, #in6buf
	movx	@dptr, a
	mov	dptr, #in6bc
	mov	a, #1
	movx	@dptr, a
	sjmp	EP6_return

has_more_than_1_byte:
	djnz	r7, has_more_than_2_bytes
; If the software sends exactly two bytes, it's intepreted as the size
; of the input buffer: the firmware will forward to the software that
; much of data read from the FPGA.
	mov	dptr, #out6buf
	movx	a, @dptr
	mov	0x22, a
	inc	dptr
	movx	a, @dptr
	mov	r0, #0x40
	jz	LessThan256
	mov	r7, a

Read256Loop:
	acall	Write_EP4
	acall	Write_EP4
	acall	Write_EP4
	acall	Write_EP4
	djnz	r7, Read256Loop

LessThan256:
	mov	a, r6
	jnb	acc.7, LessThan128
	acall	Write_EP4
	acall	Write_EP4

LessThan128:
	mov	a, r6
	jnb	acc.6, LessThan64
	acall	Write_EP4

LessThan64:
	mov	a, r6
	anl	a, #0x3f
	jz	EP6_return
	mov	r0, a
	acall	Write_EP4
	
	clr	a
	sjmp	EP6_return

; And finally, if the EP6 has more than two bytes, they are forwarded to the
; FPGA straight using the FASTXFR method.
has_more_than_2_bytes:
	mov	dptr, #autoptrh
	mov	a, #0x7b	; 0x7bc0 = out6buf
	movx	@dptr, a
	inc	dptr
	mov	a, #0xc0
	movx	@dptr, a
	inc	dptr
	; Since we decremented r7 twice, we have to send
	; two more bytes before looping.
	movx	a, @dptr
	movx	a, @dptr

EP6_Copy:
	movx	a, @dptr
	djnz	r7, EP6_Copy
	
	clr	a

EP6_return:
	mov	dptr, #out6bc
	movx	@dptr, a
	ret
