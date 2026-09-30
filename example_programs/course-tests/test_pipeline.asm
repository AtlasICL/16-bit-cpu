// ============================================================================
// test_pipeline.asm
// Course-provided test program, original name: testpipeline.txt
// Source: Imperial College London DECA labs (EEP1). Not written by me.
//
//   Checks load/store timing on the pipelined EEP1P (LDR takes an extra EXEC2 cycle).
// ============================================================================

        MOV     R0, #1          // line 1 recovered from testpipeline.ram (0x0101)
        STR     R0, [0x0040]
        STR     R0, [0x0040]
        LDR     R2, [0x0040]
        MOV     R3, R2
        ADD     R4, #1
        JMP     -1
