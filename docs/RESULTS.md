# Verification record

Date: 05 November 2026
Source revision tested: `ee0e843ff3836bea34a3d6a7a20103905eb6bfe1`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-2/actions/runs/41902291890
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-2/actions/runs/41902291861

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | 100 ordered transfers, independent clocks, full, backpressure |
| Generic Yosys synthesis | **PASS**; 1,650 technology-independent cells |
| Device-specific FPGA/ASIC utilization | **Not measured** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.

The generic cell count is obtained from the cited Yosys `stat` output and is not an FPGA LUT estimate, ASIC area, or a timing result.
