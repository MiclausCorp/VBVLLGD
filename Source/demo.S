;;
;;  demo.S
;;  Small demo bootsector application to demo the driver
;;
;;  Created by Miclaus Darius on 16/04/2021.
;;

[ORG 0x7C00]; Origin, tell the assembler that where the code will be in memory after it is been loaded
[BITS 16]; tell the assembler that its a 16 bit code

call clear; `call` `clear` from `driver.S`

mov si, DEMO_STRING; `mov` `DEMO_STRING` into `si`
call printf; `call` `printf` from `driver.S`

jmp $; halt execution.

; *** Data ***
DEMO_STRING db 'Hello, World!', 13, 10, 0

%include "Source/driver.S"

times 510 - ($ - $$) db 0 ; fill the rest of sector with 0
dw 0xAA55 ; add boot signature at the end of bootloader
