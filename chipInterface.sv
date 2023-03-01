`default_nettype none // Required in every sv file
module chipInterface
  (input logic [3:0] KEY,
  input logic [17:0] SW,
  output logic [6:0] HEX0,
  output logic [7:0] LEDG);
  logic [3:0] c;
  
  logic ww;
  myAbstractFSM(.clock(KEY[0]), .reset(SW[17]), .hMove(SW[9:6]), .cMove(c), .win(ww));
  assign LEDG = {ww, ww, ww, ww, ww, ww, ww, ww};
  logic [7:0] blank;
  assign blank = 8'b00000000;

  SevenSegmentDisplay DUT2 (.BCX0(c),
                            .blank(blank),
                            .HEX0(HEX0));

endmodule: chipInterface 



