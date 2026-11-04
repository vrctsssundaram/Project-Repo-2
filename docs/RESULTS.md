# Verification record

Date: 04 November 2026
Source revision tested: `415173ffecfe122131cb146811deed918c455796`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-2/actions/runs/41869008437

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | 100 ordered transfers, independent clocks, full, backpressure |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
