// ============================================================================
// test_arith.asm
// Course-provided test program, original name: lab1testarith.txt
// Source: Imperial College London DECA labs (EEP1). Not written by me.
//
//   Checks SUB, ADC and SBC, including carry propagation between instructions.
// ============================================================================

        MOV     R5, #3          // set up known values on R5...R7
        MOV     R6, #255
        MOV     R7, #13
        SUB     R2, R5, R6      // test SUB
        SUB     R6, #1          // test SUB with literal op2
        ADC     R0, R5, R5      // test ADC
        SBC     R1, R5, R7      // test SBC
        ADC     R2, R5, R5      // test SBC
        ADC     R2, #3          // test SBC with literal op2
        SBC     R4, #5          // test SBC with literal op2
