# FPGA One-Hot FSM — Nexys A7

7-state one-hot finite state machine in Verilog, synthesized and deployed on a Digilent Nexys A7-100T FPGA.

## What it does

- Cycles through 7 states (S0 → S1 → ... → S6 → S0) at ~1.49 Hz
- 26-bit clock divider scales the 100 MHz board clock down to human-visible speed
- Current state shown on the rightmost seven-segment digit and one-hot encoded across 7 LEDs
- Reset (BTNC) returns to S0

## File layout

```
src/
  top.v          top-level instantiation
  fsm_onehot.v   7-state one-hot FSM
  clk_div.v      parameterized clock divider
  seg7_dec.v     active-low seven-segment decoder
tb/
  tb_top.v       testbench (overrides N=3 for fast sim)
constraints/
  Nexys-A7-100T.xdc
```

## Tools

- Synthesis / implementation: Vivado 2024.1
- Simulation: QuestaSim
- Board: Digilent Nexys A7-100T
