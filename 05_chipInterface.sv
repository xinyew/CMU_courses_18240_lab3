`default_nettype none // Required in every sv file
module dFlipFlopcI(
  output logic q,
  input  logic d, clock, reset);

  always_ff @(posedge clock, posedge reset)
    if (reset == 1'b1)
      q <= 0;
    else
      q <= d;
endmodule : dFlipFlopcI

module chipInterface
  (input logic [3:0] KEY,
  input logic [17:0] SW,
  input logic CLOCK_50,
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
  output logic [7:0] LEDG,
  output logic [3:0] LEDR);
  logic [3:0] h_3, h_2, h_1, h_0, c_3, c_2, c_1, c_0;
  
  logic ww;

  task5(.newGame_L(KEY[0]), 
         .clock(CLOCK_50), 
         .h3(h_3), 
         .h2(h_2), 
         .h1(h_1), 
         .h0(h_0), 
         .c3(c_3), 
         .c2(c_2), 
         .c1(c_1), 
         .c0(c_0), 
         .enter_L(KEY[3]), 
         .reset(SW[17]),
         .hMove(SW[3:0]), 
         .cMove(LEDR[3:0]), 
         .win(ww));

  assign LEDG = {ww, ww, ww, ww, ww, ww, ww, ww};
  logic [7:0] blank;
  assign blank = 8'b00000000;
  logic reset;
  logic a1, a2, b1, b2;
  assign reset = 0;
  dFlipFlopcI ff0(.d(KEY[3]),
                .q(a1),
                .clock(CLOCK_50),
                .reset(reset)),
              ff1(.d(a1),
                .q(a2),
                .clock(CLOCK_50),
                .reset(reset));
  dFlipFlopcI ff2(.d(KEY[3]),
                .q(b1),
                .clock(CLOCK_50),
                .reset(reset)),
              ff3(.d(b1),
                .q(b2),
                .clock(CLOCK_50),
                .reset(reset));

  

  SevenSegmentDisplay(.BCX0(h_3), .blank(blank), .HEX0(HEX7));
  SevenSegmentDisplay(.BCX0(h_2), .blank(blank), .HEX0(HEX6));
  SevenSegmentDisplay(.BCX0(h_1), .blank(blank), .HEX0(HEX5));
  SevenSegmentDisplay(.BCX0(h_0), .blank(blank), .HEX0(HEX4));
  SevenSegmentDisplay(.BCX0(c_3), .blank(blank), .HEX0(HEX3));
  SevenSegmentDisplay(.BCX0(c_2), .blank(blank), .HEX0(HEX2));
  SevenSegmentDisplay(.BCX0(c_1), .blank(blank), .HEX0(HEX1));
  SevenSegmentDisplay(.BCX0(c_0), .blank(blank), .HEX0(HEX0));


endmodule: chipInterface 