# Technical design

The FIFO uses one extra pointer bit to distinguish full and empty. Write and read pointers are converted into Gray code; each Gray pointer crosses domains through a two-flop synchronizer. Full detection compares the next write pointer with the synchronized read pointer after inverting the top two Gray bits. Empty detection compares the next read pointer against the synchronized write pointer.

The storage read is asynchronous. Intended initial use: small distributed-memory FIFOs; a registered-read block RAM variant would require a separate output prefetch stage.

The reset of both domains must be asserted for initialization. Deassertion must be synchronized to each local clock in the surrounding system. Parameter `ADDR_W` must be at least 2.

This design is a CDC primitive; it does not independently certify metastability MTBF or physical placement quality.
