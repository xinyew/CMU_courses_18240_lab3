`default_nettype none // Required in every sv file
module chipInterface
  (input logic [3:0] KEY,
  input logic [17:0] SW,
  input logic CLOCK_50,
  output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
  output logic [7:0] LEDG,
  output logic [3:0] LEDR);
  logic [3:0] h3, h2, h1, h0, c3, c2, c1, c0;
  
  logic ww;
  myAbstractFSM(.newGame(KEY[0]), .clock(CLOCK_50), .h3(h3), .h2(h2), .h1(h1), 
  .h0(h0), .c3(c3), .c2(c2), c1(c1), .c0(c0), .enter(KEY[3]) .reset(SW[17]), 
  .hMove(SW[3:0]), .cMove(LEDR[3:0]), .win(ww));
  assign LEDG = {ww, ww, ww, ww, ww, ww, ww, ww};
  logic [7:0] blank;
  assign blank = 8'b00000000;

  SevenSegmentDisplay h3 (.BCX(h3), .blank(blank), .HEX(HEX7));
  SevenSegmentDisplay h2 (.BCX(h2), .blank(blank), .HEX(HEX6));
  SevenSegmentDisplay h1 (.BCX(h1), .blank(blank), .HEX(HEX5));
  SevenSegmentDisplay h0 (.BCX(h0), .blank(blank), .HEX(HEX4));
  SevenSegmentDisplay c3 (.BCX(c3), .blank(blank), .HEX(HEX3));
  SevenSegmentDisplay c2 (.BCX(c2), .blank(blank), .HEX(HEX2));
  SevenSegmentDisplay c1 (.BCX(c1), .blank(blank), .HEX(HEX1));
  SevenSegmentDisplay c0 (.BCX(c0), .blank(blank), .HEX(HEX0));


endmodule: chipInterface 



