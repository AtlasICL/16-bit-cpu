# Course test programs

> **Credit:** these programs were written by the Imperial College London DECA teaching team as part of the EEP1 lab materials. **They are not my work.** I include them because they are the programs I used to test my CPU. My own programs are in the [parent folder](../).

For each program I worked out the expected register and flag values by hand, then ran it on my design and on the reference model (`eep1model`) and compared the waveforms cycle by cycle. The logbooks show that working.

| File | Original name | What it tests | Logbook |
|---|---|---|---|
| [`test_mov_add.asm`](test_mov_add.asm) | `lab1testmovadd.txt` | MOV and ADD with register and immediate operands | [05](../../05_Datapath_and_ALU.pdf) |
| [`test_arith.asm`](test_arith.asm) | `lab1testarith.txt` | SUB, ADC and SBC, including carry passed from one instruction to the next | [05](../../05_Datapath_and_ALU.pdf) |
| [`test_and_cmp.asm`](test_and_cmp.asm) | `lab1testandcmp.txt` | CMP (sets flags without writing a result) and bitwise AND | [05](../../05_Datapath_and_ALU.pdf) |
| [`test_shift.asm`](test_shift.asm) | `lab1testshift.txt` | Barrel shifter: LSL, LSR, ASR, XSR | [05](../../05_Datapath_and_ALU.pdf) |
| [`test_pipeline.asm`](test_pipeline.asm) | `testpipeline.txt` | Load/store timing on the pipelined EEP1P | [07](../../07_Pipelining_and_Interrupts.pdf) |
| [`io_poll_irq0.asm`](io_poll_irq0.asm) | `iotest1.txt` | Counting IRQ0 events by polling through memory-mapped I/O | [07](../../07_Pipelining_and_Interrupts.pdf) |
| [`interrupt_two_sources.asm`](interrupt_two_sources.asm) | `int-test2.txt` | Two interrupt sources sharing one interrupt service routine (ISR); the base program's R0 and flags are saved and restored | [07](../../07_Pipelining_and_Interrupts.pdf) |

## Transcription notes

- I recovered these files from screenshots in the logbooks. I changed the names, the column alignment and the headers. Instructions and inline comments are as the course wrote them.
- **`test_pipeline.asm`:** the screenshot cuts off line 1. I rebuilt it as `MOV R0, #1` by decoding the first word (`0x0101`) of `testpipeline.ram`, which the logbook shows in full.
- **First-line comments:** in `test_arith`, `test_and_cmp` and `test_shift`, the screenshots cut off the end of the first comment, so I completed it.
- **Left as written:** a few oddities from the course files are kept unchanged. `test_arith` labels two `ADC` lines "test SBC", and `interrupt_two_sources` stores `R1` rather than `R0` on its "Interrupt 0 reset low" line.
- **Not included:** `int-test1.txt`, because its code doesn't appear in the logbooks.
