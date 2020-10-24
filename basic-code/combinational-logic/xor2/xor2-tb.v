`timescale 1ns / 1ns
`include "xor2.v"

module xor2_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg        CLK, RST;
reg        IN;
wire       OUT;

// UUT
xor2 uut(
    .clk(CLK), .rst(RST),
    .in(IN),
    .out(OUT)
);

// FILES
initial begin
    $dumpfile("xor2-tb.vcd");
    $dumpvars(0, xor2_tb);
end

// CLOCK
always begin
    #10 CLK = ~CLK;
end

// TESTCASE
initial begin
    $display("test start");
    CLK = 0;
    RST = 0;
    IN = 0;

    #15; RST = 1;
    #20; RST = 0;

    #20; IN = 1;
    #20; IN = 0;
    #20; IN = 1;
    #20; IN = 0;
    #20; IN = 0;
    
    // DONE
    #20

    $display("test complete");
    $finish;
end

endmodule
