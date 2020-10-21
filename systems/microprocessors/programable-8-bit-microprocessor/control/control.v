// 8-bit microprocessor control section
`include "core-parts/counter8.v"

module control(
    input  [3:0]    OPCODE,             //
    input           GO_BAR,             // 
    input           RESET,              // 
    input           JAM,                // 
    input           SYSTEM_CLK,         //
    input  [3:0]    STATUS_BITS,        // 
    input  [23:0]   MW,                 //
    output [7:0]    MICROADDRESS,       //
    output [23:13]  CONTROL_BITS,       //
    output          EIL_BAR             // 
);

assign MICROADDRESS = 8'h01;                    // ERASE
assign CONTROL_BITS = 11'b00000000000;          // ERASE
assign EIL_BAR = 1'b0;                          // ERASE

// WIRES
wire [3:0]      MICRO_AD_LOW;
wire [7:4]      MICRO_AD_HIGH;
wire            COUNT;
wire [12:9]     BOP;
wire [23:13]    CONTROL_BITS;                   // NOT IN THESIS
wire [7:4]      COUNTER_IN_HIGH_SIG;
wire [7:0]      BUFFER_IN;
wire            MPC_LOAD_BAR;
wire            COND_OUT;
wire            HIGH;
wire [7:0]      HIGH8;
wire            LOW;
wire            NOTHING;

// BREAK UP THE MICROWORD
assign MICRO_AD_LOW     = MW[3:0];
assign MICRO_AD_HIGH    = MW[7:4];
assign COUNT            = MW[8];
assign BOP              = MW[12:9];
assign CONTROL_BITS     = MW[23:13];

// ASSIGN VALUES
assign HIGH             = 1'b1;
assign HIGH8            = 8'b11111111;
assign LOW              = 1'b0;

// COUNTER8 SECTION
counter8 COUNTER_8 (
    .COUNTER_IN_LOW(MICRO_AD_LOW),
    .COUNTER_IN_HIGH(COUNTER_IN_HIGH_SIG),
    .MPC_LOAD_BAR(MPC_LOAD_BAR),
    .RESET(RESET),
    .COUNT(COUNT),
    .SYSTEM_CLK(SYSTEM_CLK),
    .COUNTER_OUT(BUFFER_IN)
);

// MUX8 SECTION

// OPCODEDEC SECTION

// COND_SELECT SECTION

// XOR2 SECTION

endmodule