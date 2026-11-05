# Dual-clock stream FIFO

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

**Architecture:** Parameterized dual-clock ready/valid FIFO with synchronized Gray pointers and per-domain resets.

Project owner: Sundaram S S.
