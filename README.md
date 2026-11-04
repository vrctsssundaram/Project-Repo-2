# SafeCDC-Stream

Dual-clock ready/valid FIFO using synchronized Gray-coded pointers.

## Features

- Independent read/write clocks
- Full/empty tracking and dual-flop pointer synchronization
- Self-checking ordered transfer regression

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Scope:** Needs physical CDC constraints and FPGA implementation analysis before board integration.

Project owner: Sundaram S S.
