IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_async_stream_fifo -o build/sim rtl/async_stream_fifo.sv tb/tb_async_stream_fifo.sv
	$(VVP) build/sim
