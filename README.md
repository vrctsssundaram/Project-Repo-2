# SafeCDC-Stream

Parameterized dual-clock streaming FIFO with Gray-coded pointers and two-stage pointer synchronization.

This design provides independent valid/ready ports across unrelated clock domains. It supports a power-of-two capacity of `2**ADDR_W` words, with full and empty indications and deterministic in-order delivery.

Run `make test` to exercise independently clocked writer/reader traffic, backpressure, full indication, and data ordering.

Directories: `rtl/`, `tb/`, `docs/`.

Project owner: Sundaram S S.
