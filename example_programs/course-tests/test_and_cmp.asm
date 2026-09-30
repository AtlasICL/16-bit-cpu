// ============================================================================
// test_and_cmp.asm
// Course-provided test program, original name: lab1testandcmp.txt
// Source: Imperial College London DECA labs (EEP1). Not written by me.
//
//   Checks CMP (flags only, no write-back) and bitwise AND.
// ============================================================================

        MOV     R5, #3          // set up known values on R5...R7
        MOV     R6, #255
        MOV     R7, #13
        CMP     R5, R6          // test CMP
        CMP     R5, #3          // test CMP with literal op2
        AND     R0, R5, R7      // test AND
        AND     R0, #0x10       // test AND with literal op2
