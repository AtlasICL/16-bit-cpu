// ============================================================================
// multiply_32bit.asm
// 16 x 16 -> 32-bit unsigned multiply using the shift-and-add method (EEP1)
//
//   Computes  R6:R5 = op1 * op2
//   e.g. 2583 * 4381 = 11,316,123  ->  R6 = 0x00AC, R5 = 0xAB9B
//
//   32-bit values are stored as register pairs (high:low). EEP1 has no
//   extended left shift, so a 32-bit shift left is done as ADD (low word)
//   followed by ADC (high word, taking the carry from the low word).
//
//   Registers:
//     R0  temporary copy of op1 (used to test the low bit)
//     R1  op1                   R2  op2
//     R4:R3  op2_shifted        R6:R5  sum
//
//   EEP1 has no HALT instruction: on exit, JEQ lands on the final JMP, so the
//   CPU idles in a CMP -> JEQ -> JMP loop with the result held in R6:R5.
// ============================================================================

// --- setup -------------------------------------------------------------------
        EXT     0x0A            // upper 8 bits for the next immediate
        MOV     R1, #0x17       // op1 = 0x0A17 = 2583
        EXT     0x11
        MOV     R2, #0x1D       // op2 = 0x111D = 4381
        MOV     R5, #0          // sum (low)          = 0
        MOV     R6, #0          // sum (high)         = 0
        MOV     R3, R2          // op2_shifted (low)  = op2
        MOV     R4, #0          // op2_shifted (high) = 0

// --- while (op1 != 0) --------------------------------------------------------
// loop:
        CMP     R1, #0          // op1 == 0 ?
        JEQ     #9              //   yes -> exit (idles on final JMP)
        MOV     R0, R1          // R0 = op1
        LSR     R0, R0, #1      // shift low bit of op1 into carry
        JCC     #3              // bit was 0 -> skip the add
        ADD     R5, R5, R3      //   sum.low  += op2_shifted.low
        ADC     R6, R6, R4      //   sum.high += op2_shifted.high + carry
        ADD     R3, R3, R3      // op2_shifted.low  <<= 1
        ADC     R4, R4, R4      // op2_shifted.high <<= 1, with carry in
        LSR     R1, R1, #1      // op1 >>= 1
        JMP     #-10            // back to loop
