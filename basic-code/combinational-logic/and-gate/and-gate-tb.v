`timescale 1ns / 1ns

// include files in and-gate-headerfiles.vh

module and_gate_tb;

// DATA TYPES - DECLAIR INPUTS AND OUTPUTS
reg  X, Y;
wire XY;

// UUT
and_gate uut(
    .x(X), .y(Y),
    .xy_1(XY_1), .xy_2(XY_2), .xy_3(XY_3), .xy_4(XY_4)
);

// FILES
initial begin
    $dumpfile("and-gate-tb.vcd");
    $dumpvars(0, and_gate_tb);
end

// TESTCASE
initial begin
    $display("test start");
    X = 0; Y = 0;
    
    #10 X = 1; Y = 0;
    #10 X = 0; Y = 1;
    #10 X = 1; Y = 1;
    #10
    
    $display("test complete");
    $finish;
end

endmodule
