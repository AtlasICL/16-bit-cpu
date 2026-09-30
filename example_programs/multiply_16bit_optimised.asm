// ============================================================================
// multiply_16bit_optimised.asm
// 16-bit unsigned multiply using the shift-and-add method (EEP1), optimised
//
//   Computes  R0 = op1 * op2  (low 16 bits)   e.g. 12 * 5 = 60
//
//   Optimisation over multiply_16bit.asm: op1 is shifted only once per
//   iteration, and the bit shifted out (captured in the carry flag) decides
//   whether to add. This removes two instructions and frees R4.
//
//   Registers:
//     R0  sum           R1  op1
//     R2  op2           R3  op2_shifted
// ============================================================================

// --- setup -------------------------------------------------------------------
        MOV     R1, #12         // op1 = 12
        MOV     R2, #5          // op2 = 5
        MOV     R0, #0          // sum = 0
        MOV     R3, R2          // op2_shifted = op2

// --- while (op1 != 0) --------------------------------------------------------
// loop:
        CMP     R1, #0          // op1 == 0 ?
        JEQ     #8              //   yes -> exit loop
        LSR     R1, R1, #1      // op1 >>= 1, low bit goes to carry
        JCC     #2              // bit was 0 -> skip the add
        ADD     R0, R0, R3      //   sum += op2_shifted
        LSL     R3, R3, #1      // op2_shifted <<= 1
        CMP     R1, #0          // op1 == 0 ?
        JNE     #-7             //   no -> back to loop
