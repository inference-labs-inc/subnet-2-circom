# Proof of Weights for Omron

This repo contains source files for the circom implementation of Omron's incentive mechanism.

## Steps to reproduce output

### 1. Adjust the `batch_size` in `src/circuit.circom`

The last line in this file appears as:

```circom
]} = IncentiveMechanism(1024,40);
```

To generate the circuit for a different batch size, you need to change the first argument to the `IncentiveMechanism` component (for example `256` for SN2 PoW 256).

### Run circom to export the circuit

This will provide the WASM, raw R1CS, witness generation code, symbols and C code for the circuit.

```bash
circom --r1cs --wasm --c --sym --inspect circuit.circom
```

If successful, you should see the following output:

```log
Written successfully: ./circuit.r1cs
Written successfully: ./circuit.sym
Written successfully: ./circuit_cpp/circuit.cpp and ./circuit_cpp/circuit.dat
Written successfully: ./circuit_cpp/main.cpp, circom.hpp, calcwit.hpp, calcwit.cpp, fr.hpp, fr.cpp, fr.asm and Makefile
Written successfully: ./circuit_js/circuit.wasm
Everything went okay
```
