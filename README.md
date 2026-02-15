# Binary Array Multiplier (Verilog)

## Overview
This project implements a combinational binary array multiplier in Verilog. The circuit multiplies two unsigned binary integers by explicitly constructing the multiplication process from logic gates and adders rather than using built-in arithmetic operators.

The purpose of the project was to understand how multiplication, which appears as a single instruction in software, is actually realized at the hardware level inside digital systems.

## Motivation
In software, writing a * b looks like a primitive operation. In hardware, multiplication must be built from simpler digital components. AND gates create partial products, half adders and full adders accumulate sums, and carry signals propagate across the circuit. This project explores that structure directly using a hardware description language.

## Architecture
The design follows a standard array multiplier architecture. Each bit of the multiplicand is ANDed with each bit of the multiplier to generate partial products. The partial products are aligned according to bit significance, then summed using a network of adders. Carries propagate across the array and the final binary product is produced.

![Array Multiplier Diagram](multiplier_diagram.jpg)

Hand-drawn block diagram of the array multiplier architecture showing partial product generation and carry propagation.

## Key Components
Partial Product Generation:
Each pair of input bits produces a partial product according to P(i,j) = Ai AND Bj. These partial products form the multiplication matrix.

Addition Network:
The partial products are accumulated using half adders, which combine two bits into a sum and carry, and full adders, which combine three bits into a sum and carry. Carry signals propagate through the array to produce the final result.

## Files
array_multiplier.v - top-level multiplier module  
half_adder.v - half adder implementation  
full_adder.v - full adder implementation  
testbench.v - simulation and verification

## Verification
A Verilog testbench is used to validate correctness. Multiple binary input pairs are applied, the circuit is simulated, and the output product is compared to expected multiplication results. The simulation confirms correct behavior for representative input cases.

## What This Demonstrates
This project highlights several digital design concepts. Arithmetic operations are constructed from basic logic gates. Hardware performs computation structurally rather than procedurally. Carry propagation is an important consideration in circuit design. Hardware description languages model real physical computation.

It connects high-level programming abstractions to the underlying circuitry executed by a processor.

## Possible Extensions
Potential improvements include signed multiplication using two’s complement representation, implementing a Booth multiplier, pipelining the multiplier architecture, and synthesizing the design on FPGA hardware with timing analysis.

## Technologies
Verilog HDL  
Digital logic design  
Combinational circuit simulation

## Takeaway
This project provides a concrete example of how high-level arithmetic operations are implemented at the circuit level and helps bridge the gap between software programming and computer architecture.
