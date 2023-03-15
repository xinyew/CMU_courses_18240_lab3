`default_nettype none // Required in every sv file
module chipInterface
  (input logic [3:0] KEY,
  input logic [17:0] SW,
  input logic CLOCK_50,
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
  output logic [7:0] LEDG,
  output logic [3:0] LEDR);
  logic [3:0] h_3, h_2, h_1, h_0, c_3, c_2, c_1, c_0;
  
  logic ww;

  task5 S0 (.newGame(KEY[0]), 
            .clock(CLOCK_50), 
				.h3(h_3), 
				.h2(h_2), 
				.h1(h_1), 
            .h0(h_0), 
				.c3(c_3), 
				.c2(c_2), 
				.c1(c_1), 
				.c0(c_0), 
				.enter(KEY[3]), 
				.reset(SW[17]),
				.hMove(SW[3:0]), 
				.cMove(LEDR[3:0]), 
				.win(ww));

  assign LEDG = {ww, ww, ww, ww, ww, ww, ww, ww};
  logic [7:0] blank;
  assign blank = 8'b00000000;

  SevenSegmentDisplay s1 (.BCX(h_3), .blank(blank), .HEX(HEX7));
  SevenSegmentDisplay s2 (.BCX(h_2), .blank(blank), .HEX(HEX6));
  SevenSegmentDisplay s3 (.BCX(h_1), .blank(blank), .HEX(HEX5));
  SevenSegmentDisplay s4 (.BCX(h_0), .blank(blank), .HEX(HEX4));
  SevenSegmentDisplay s5 (.BCX(c_3), .blank(blank), .HEX(HEX3));
  SevenSegmentDisplay s6 (.BCX(c_2), .blank(blank), .HEX(HEX2));
  SevenSegmentDisplay s7 (.BCX(c_1), .blank(blank), .HEX(HEX1));
  SevenSegmentDisplay s8 (.BCX(c_0), .blank(blank), .HEX(HEX0));


endmodule: chipInterface 


