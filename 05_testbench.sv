`default_nettype none

module testbench();
  logic [3:0] cMove, hMove;
  logic [3:0] h3, h2, h1, h0, c3, c2, c1, c0;
  logic win, clock, reset, enter_L, newGame_L;

  task5 DUT (.*);
  
  initial begin
    $monitor($time,, "state: %30s cMove: %d hMove: %d win: %b \
// h3: %d h2: %d h1: %d h0: %d c3: %d c2: %d c1: %d c0: %d",
                      DUT.currState.name, cMove, hMove, win,
                      h3, h2, h1, h0, c3, c2, c1, c0);
    // init
    clock = 0;
    reset = 1;
    reset <= 0;

    forever #10 clock = ~clock;
  end

  initial begin
    // C_5
    @(posedge clock);
    hMove <= 4'd4;
    enter_L <= 1'd0;
    @(posedge clock) // #10 C_5_I
    @(posedge clock) // #30
    enter_L <= 1'd1;
    @(posedge clock) // #50 C_5
    hMove <= 4'd6;
    @(posedge clock) // #70 C_5
    enter_L <= 1'd0;
    @(posedge clock) // #90 C_5_H_6_E
    @(posedge clock) // #110 C_5_H_6_E
    enter_L <= 1'd1;
    @(posedge clock) // #130 C_1_5_H_6

    enter_L <= 1'd0;
    @(posedge clock) // #150 C_1_5_H_6_I
    enter_L <= 1'd1;
    @(posedge clock) // #170 C_1_5_H_6

    hMove <= 4'd9;
    @(posedge clock); // #190 C_1_5_H_6
    enter_L <= 1'd0;
    @(posedge clock); // #210 C_1_5_H_6_9_E
    enter_L <= 1'd1;
    @(posedge clock); // #230 C_1_3_5_H_6_9
    #1 $finish;
  end
endmodule : testbench