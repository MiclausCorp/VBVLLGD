;;
;;  driver.S
;;  Basic Graphics Driver for outputting text in 16 bits mode
;;
;;  Created by Miclaus Darius on 16/04/2021.
;;

[bits 16]

; Print String Main method
;; Usage: 
    ;;; 1. `mov` any null teminated string stored with db into `si`
    ;;; 2. `call` `printf`
;;
printf:
    pusha ; Push All General-Purpose Registers.
    str_loop: ; String loop that goes over the whole string character by character.
        mov al, [si]; `mov` `al` into the memory contained in `si`.
        cmp al, 0 ; Check if `al` is 0.
        jne print_char ; Jump if Condition Is Met to print_char.
        popa ; Pop All General-Purpose Registers.
    ret ; Return.

    ; Print Character private method.
    print_char:
        mov ah, 0x0e ; Indicate Tele-type mode.
        int 0x10 ; Calls `0x10` Interrupt which tells the BIOS to output to the screen.
        add si, 1 ; Increment `si` to go to the next character.
        jmp str_loop ; we go back to `str_loop` to continue.

; Clear Screen method
clear:
    pusha ; Push All General-Purpose Registers.
        mov ah, 0x00 ; Black.
        mov al, 0x03 ; text mode 80x25 16 colors.
        int 0x10 ; call the BIOS to output to the screen.
    popa ; Pop All General-Purpose Registers.
    ret ; Return.
