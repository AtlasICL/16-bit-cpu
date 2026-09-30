// ============================================================================
// io_poll_irq0.asm
// Course-provided test program, original name: iotest1.txt
// Source: Imperial College London DECA labs (EEP1). Not written by me.
//
//   Polls IRQ0 through memory-mapped I/O and counts events in R2 (software loop, no interrupts).
// ============================================================================

        LDR     R0, [0xFFFE]    // load IRQ status
        AND     R0, #1          // test IRQ0
        JEQ     -2              // loop if no IRQ0
        MOV     R0, #1
        STR     R0, [0xFFFF]    // reset IRQ0
        MOV     R0, #0
        STR     R0, [0xFFFF]    // stop reset
        ADD     R2, #1          // increment software counter
        JMP     -8
