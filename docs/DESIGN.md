# Technical design

The FIFO uses one extra pointer bit to distinguish full and empty. Write and read pointers are converted into Gray code; each Gray pointer crosses domains through a two-flop synchronizer. Full detection compares the next write pointer with the synchronized read pointer after inverting the top two Gray bits. Empty detection compares the next read pointer against the synchronized write pointer.

Both reset domains initialize the FIFO pointers. Local reset release is clock-synchronous; `ADDR_W >= 2`.

The Gray-pointer synchronizers are tagged for physical CDC placement and timing analysis.
