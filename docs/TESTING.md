# Test procedure

1. Run `make test`.
2. Confirm `PASS` and exit code 0.
3. Confirm the hosted RTL regression passes for the pushed commit.

Coverage exercised: two unrelated clocks, 100 sequential words, full status, backpressure, data integrity and ordering.

FPGA-specific validation still requires synchronizer constraints, CDC analysis, synthesis, static timing, and reset-domain review.
