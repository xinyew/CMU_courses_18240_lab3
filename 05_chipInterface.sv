`default_nettype none // Required in every sv file

module Dflipflop
  (input  logic D,
   input  logic clock, preset, reset,
   output logic Q);
  
  always_ff @(posedge clock)
    if (reset && preset)
      Q <= 1'bx;
    else if (reset)
      Q <= 1'b0;
    else if (preset)
      Q <= 1'b1;
    else
      Q <= D;

endmodule : Dflipflop

module chipInterface
  (input logic [3:0] KEY,
  input logic [17:0] SW,
  input logic CLOCK_50,
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
  output logic [7:0] LEDG,
  output logic [3:0] LEDR);

  // sync enter_L, newGame_L using clock from FPGA
  logic enter_L, newGame_L;
  Dflipflop(.D(KEY[3]),
            .Q(enter_L),
            .clock(CLOCK_50),
            .preset(SW[17]));

  Dflipflop(.D(KEY[0]),
            .Q(newGame_L),
            .clock(CLOCK_50),
            .preset(SW[17]));

  logic [3:0] h_3, h_2, h_1, h_0, c_3, c_2, c_1, c_0;
  logic ww;
  
  // task5 instantiation
  task5(.newGame_L(newGame_L), 
         .clock(CLOCK_50), 
         .h3(h_3), 
         .h2(h_2), 
         .h1(h_1), 
         .h0(h_0), 
         .c3(c_3), 
         .c2(c_2), 
         .c1(c_1), 
         .c0(c_0), 
         .enter_L(enter_L), 
         .reset(SW[17]),
         .hMove(SW[3:0]), 
         .cMove(LEDR[3:0]), 
         .win(ww));
  
  // LEDG display
  assign LEDG = {ww, ww, ww, ww, ww, ww, ww, ww};

  // HEX display
  logic [7:0] blank;
  assign blank = 8'b00000000;
  SevenSegmentDisplay(.BCX0(h_3), .blank(blank), .HEX0(HEX7));
  SevenSegmentDisplay(.BCX0(h_2), .blank(blank), .HEX0(HEX6));
  SevenSegmentDisplay(.BCX0(h_1), .blank(blank), .HEX0(HEX5));
  SevenSegmentDisplay(.BCX0(h_0), .blank(blank), .HEX0(HEX4));
  SevenSegmentDisplay(.BCX0(c_3), .blank(blank), .HEX0(HEX3));
  SevenSegmentDisplay(.BCX0(c_2), .blank(blank), .HEX0(HEX2));
  SevenSegmentDisplay(.BCX0(c_1), .blank(blank), .HEX0(HEX1));
  SevenSegmentDisplay(.BCX0(c_0), .blank(blank), .HEX0(HEX0));

endmodule: chipInterface 
