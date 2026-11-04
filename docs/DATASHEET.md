# Interface summary

| Signal | Meaning |
|---|---|
| `wr_clk`, `rd_clk` | Independent write/read clocks |
| `wr_rst_n`, `rd_rst_n` | Local active-low asynchronous reset |
| `wr_data[DATA_W-1:0]` | Data input |
| `wr_valid`, `wr_ready` | Input transfer handshake |
| `rd_data[DATA_W-1:0]` | Data output |
| `rd_valid`, `rd_ready` | Output transfer handshake |
| `wr_full`, `rd_empty` | Local-domain occupancy boundary indications |
| `DATA_W` | Data width, default 32 |
| `ADDR_W` | Log2 capacity, default 4 |

Latency includes at least two receiving-domain synchronizer stages. Exact cycles depend on clock ratios and traffic.
