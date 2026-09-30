// ============================================================================
// test_mov_add.asm
// Course-provided test program, original name: lab1testmovadd.txt
// Source: Imperial College London DECA labs (EEP1). Not written by me.
//
//   Checks MOV and ADD with register and 8-bit immediate operands.
// ============================================================================

        MOV     R5, #3          // set up known values on R5...R7
        MOV     R6, #-1
        MOV     R7, #13
        MOV     R0, R6          // test MOV
        ADD     R1, R5, R7      // test ADD
        ADD     R2, #3          // test ADD with literal op2
        ADD     R4, #255        // test ADD with literal op2
