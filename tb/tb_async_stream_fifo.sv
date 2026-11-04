module tb_async_stream_fifo;
    timeunit 1ns; timeprecision 1ps;
    reg wr_clk = 0, rd_clk = 0;
    always #3.5 wr_clk = ~wr_clk;
    always #5.5 rd_clk = ~rd_clk;
    reg wr_rst_n = 0, rd_rst_n = 0;
    reg rd_ready = 0;
    reg [31:0] sent = 0;
    integer received = 0;
    integer rd_cycles = 0;
    reg saw_full = 0;
    wire wr_ready, wr_full, rd_valid, rd_empty;
    wire [31:0] rd_data;
    wire wr_valid = wr_rst_n && (sent < 100);

    async_stream_fifo #(.DATA_W(32), .ADDR_W(3)) dut (
        .wr_clk(wr_clk), .wr_rst_n(wr_rst_n), .wr_data(sent),
        .wr_valid(wr_valid), .wr_ready(wr_ready), .wr_full(wr_full),
        .rd_clk(rd_clk), .rd_rst_n(rd_rst_n), .rd_data(rd_data),
        .rd_valid(rd_valid), .rd_ready(rd_ready), .rd_empty(rd_empty)
    );

    always @(posedge wr_clk) if (wr_rst_n) begin
        if (wr_full) saw_full <= 1;
        if (wr_valid && wr_ready) sent <= sent + 1;
    end
    always @(negedge rd_clk) if (rd_rst_n) begin
        rd_cycles = rd_cycles + 1;
        rd_ready = (rd_cycles > 12) && ((rd_cycles % 4) != 0);
    end
    always @(posedge rd_clk) if (rd_rst_n && rd_valid && rd_ready) begin
        if (rd_data !== received[31:0])
            $fatal(1, "FIFO ordering/data mismatch at %0d: %h", received, rd_data);
        received = received + 1;
        if (received == 100) begin
            if (!saw_full || sent != 100)
                $fatal(1, "Expected full/backpressure coverage absent");
            $display("PASS: 100 ordered transfers, independent clocks, full, backpressure");
            $finish;
        end
    end
    initial begin
        #25; wr_rst_n = 1; rd_rst_n = 1;
        #30000; $fatal(1, "Watchdog timeout");
    end
endmodule
