module async_stream_fifo #(
    parameter integer DATA_W = 32,
    parameter integer ADDR_W = 4
) (
    input  wire              wr_clk,
    input  wire              wr_rst_n,
    input  wire [DATA_W-1:0] wr_data,
    input  wire              wr_valid,
    output wire              wr_ready,
    output reg               wr_full,
    input  wire              rd_clk,
    input  wire              rd_rst_n,
    output wire [DATA_W-1:0] rd_data,
    output wire              rd_valid,
    input  wire              rd_ready,
    output reg               rd_empty
);
    localparam integer DEPTH = 1 << ADDR_W;
    reg [DATA_W-1:0] ram [0:DEPTH-1];
    reg [ADDR_W:0] wr_bin, wr_gray;
    reg [ADDR_W:0] rd_bin, rd_gray;
    (* async_reg = "true" *) reg [ADDR_W:0] wr_gray_rd1, wr_gray_rd2;
    (* async_reg = "true" *) reg [ADDR_W:0] rd_gray_wr1, rd_gray_wr2;

    wire write_fire = wr_valid && wr_ready;
    wire read_fire = rd_valid && rd_ready;
    wire [ADDR_W:0] wr_bin_next = wr_bin + write_fire;
    wire [ADDR_W:0] rd_bin_next = rd_bin + read_fire;
    wire [ADDR_W:0] wr_gray_next = (wr_bin_next >> 1) ^ wr_bin_next;
    wire [ADDR_W:0] rd_gray_next = (rd_bin_next >> 1) ^ rd_bin_next;
    wire [ADDR_W:0] full_compare =
        {~rd_gray_wr2[ADDR_W:ADDR_W-1], rd_gray_wr2[ADDR_W-2:0]};

    assign wr_ready = !wr_full;
    assign rd_valid = !rd_empty;
    assign rd_data = ram[rd_bin[ADDR_W-1:0]];

    always @(posedge wr_clk or negedge wr_rst_n) begin
        if (!wr_rst_n) begin
            wr_bin <= 0;
            wr_gray <= 0;
            wr_full <= 0;
            rd_gray_wr1 <= 0;
            rd_gray_wr2 <= 0;
        end else begin
            rd_gray_wr1 <= rd_gray;
            rd_gray_wr2 <= rd_gray_wr1;
            if (write_fire)
                ram[wr_bin[ADDR_W-1:0]] <= wr_data;
            wr_bin <= wr_bin_next;
            wr_gray <= wr_gray_next;
            wr_full <= (wr_gray_next == full_compare);
        end
    end

    always @(posedge rd_clk or negedge rd_rst_n) begin
        if (!rd_rst_n) begin
            rd_bin <= 0;
            rd_gray <= 0;
            rd_empty <= 1;
            wr_gray_rd1 <= 0;
            wr_gray_rd2 <= 0;
        end else begin
            wr_gray_rd1 <= wr_gray;
            wr_gray_rd2 <= wr_gray_rd1;
            rd_bin <= rd_bin_next;
            rd_gray <= rd_gray_next;
            rd_empty <= (rd_gray_next == wr_gray_rd2);
        end
    end
endmodule
