# Parameterised ALU (Verilog HDL)

A parameterised Arithmetic Logic Unit (ALU) designed in Verilog HDL and verified using Vivado Simulator.

## Features

- Parameterised data width
- Addition
- Subtraction
- AND
- OR
- XOR
- NOT
- Shift Left
- Shift Right
- Increment
- Decrement
- Pass A
- Pass B
- Carry Flag
- Overflow Flag
- Zero Flag
- Negative Flag

## Project Structure

```
parameterized-alu
│
├── src
│   └── alu.v
│
├── tb
│   └── alu_tb.v
│
├── waveform
│   └── alu_waveform.png
│
└── README.md
```

## Tools Used

- Verilog HDL
- Xilinx Vivado 2025.1
- Vivado Simulator

## Simulation

The design was verified using a behavioural testbench covering:

- Arithmetic operations
- Logical operations
- Shift operations
- Carry flag
- Overflow flag
- Zero flag
- Negative flag

## Author

Neeha Jasmine
