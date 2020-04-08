.global bruh
.global _start
.global main
.extern test
.extern oof

.text

main:
bruh:

    #
    mov %rsp, %rbp

  


    # Make abba
    movb $65, -1(%rbp)
    movb $66, -2(%rbp)
    movb $66, -3(%rbp)
    movb $65, -4(%rbp)
    
    # Set address of string
    mov %rbp, %rcx
    sub $4, %rcx


  # Set system call number
    movl $4, %eax

    # Provide file descriptor number
    movl $2, %ebx

   

    # Add length
    movl $4, %edx

    int $0x80

    

    # Exit
    movl $2, %ebx
    movl $1, %eax
    int $0x80
