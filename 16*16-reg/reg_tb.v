`timescale 1ns / 1ps

module reg_tb;
reg clk;
reg [15:0] wr_data;
reg [3:0] wr_addr;
reg [3:0] rd_addr1;
reg [3:0] rd_addr2;
reg en;

wire [15:0] rd_data1;
wire [15:0] rd_data2;

reg_rtl uut (
    .clk(clk),
    .wr_data(wr_data),
    .wr_addr(wr_addr),
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),
    .en(en),
    .rd_data1(rd_data1),
    .rd_data2(rd_data2)
);

always #5 clk = ~clk; 
initial begin
    clk = 0;
    en = 0;
    wr_addr = 0;
    wr_data = 0;
    rd_addr1 = 0;
    rd_addr2 = 0;

    #10;
    en = 1;

    wr_addr = 4'd1;
    wr_data = 16'b1011001001110100;
    #10;
    rd_addr1 = 4'd1;
    rd_addr2 = 4'd1;
    #10;
    
   
    wr_addr = 4'd2;
    wr_data = 16'b1110101001111100;
    #10;
    rd_addr1 = 4'd1;
    rd_addr2 = 4'd2;
    #10;

    
    wr_addr = 4'd3;
    wr_data = 16'b1000001001110111;
    #10;
    rd_addr1 = 4'd3;
    rd_addr2 = 4'd1;
    #10;

$display("READ1 = %h, READ2 = %h", rd_data1, rd_data2);
   $stop;
end

endmodule

