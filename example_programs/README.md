# EEP1 assembly programs

These are assembly programs I wrote for the EEP1 CPU. EEP1 has no multiply instruction, so all three multiply in software using the **shift-and-add** method:

```c
sum = 0;
op2_shifted = op2;
while (op1 != 0) {
    if (op1 & 1) sum += op2_shifted;   // add op2 wherever op1 has a 1 bit
    op2_shifted <<= 1;
    op1 >>= 1;
}
```

| File | What it does | Result |
|---|---|---|
| [`multiply_16bit.asm`](multiply_16bit.asm) | 16-bit multiply, a direct translation of the C loop above | `12 × 5 = 60` in `R0` |
| [`multiply_16bit_optimised.asm`](multiply_16bit_optimised.asm) | Shifts `op1` once and branches on the carry flag from that shift, instead of copying `op1` to a temporary register to test whether it is odd. That saves 2 instructions and frees `R4`. | `12 × 5 = 60` in `R0` |
| [`multiply_32bit.asm`](multiply_32bit.asm) | Multiplies two 16-bit numbers into a 32-bit result held in a register pair. It uses `ADD`/`ADC` pairs for the 32-bit add and for the 32-bit shift left (EEP1 has no extended left shift), and `EXT` to load 16-bit constants. | `2583 × 4381 = 11,316,123`, so `R6:R5 = 0x00AC:0xAB9B` |

## Course test programs

[`course-tests/`](course-tests/) holds the test programs the course provided for checking the hardware: ALU operations, shifts, pipeline timing, I/O polling and interrupts. They are credited to the DECA teaching team and are not my own work.

## Running a program

1. Assemble it with the EEP1 assembler, which turns an assembly file into a `.ram` file. The course assembler expected `.txt` input, so you may need to rename the `.asm` file first.
2. In Issie, point the `CODEMEM` ROM's data source at the `.ram` file.
3. Run the waveform simulator and watch the result registers.

## Notes

- Comment-only lines and blank lines are only there for readability. The assembler accepts them (the course's own `int-test2` program uses them), and jump offsets count instructions only.
- Jump offsets are PC-relative. For example, `JNE #-7` jumps back 7 instructions.
- `MOV Ra, #imm` takes an 8-bit **signed** immediate. For larger constants, put an `EXT` instruction before it to supply the upper bits.
- EEP1 has no `HALT` instruction. When `multiply_32bit.asm` finishes, its exit branch (`JEQ #9`) lands on the loop's `JMP`, so the CPU keeps cycling through `CMP` → `JEQ` → `JMP` with the result held in `R6:R5`. In effect this acts as a halt loop.
- I recovered these files from the screenshots in logbook [06 – Control Path & Jumps](../06_Control_Path_and_Jumps.pdf). `multiply_32bit.asm` is the corrected version from the logbook, with `ADC R6, R6, R4` on the high-word add.
