`default_nettype none

module testbench();
  logic [3:0] cMove, hMove;
  logic [3:0] h3, h2, h1, h0, c3, c2, c1, c0;
  logic win, clock, reset, enter, newGame;

  task5 DUT (.*);
  
  initial begin
    $monitor($time,, "state: %s, cMove: %b, hMove: %b, win: %b \
                      h3: %d, h2: %d, h1: %d, h0: %d, c3: %d, c2: %d, c1: %d, c0: %d",
                      DUT.currState.name, cMove, hMove, win,
                      h3, h2, h1, h0, c3, c2, c1, c0);
endmodule : testbench