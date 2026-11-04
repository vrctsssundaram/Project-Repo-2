IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_async_stream_fifo -o build/sim rtl/async_stream_fifo.sv tb/tb_async_stream_fifo.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/async_stream_fifo.sv; hierarchy -check -top async_stream_fifo; synth -top async_stream_fifo; stat'
