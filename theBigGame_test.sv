`default_nettype none

module task5 (
  output logic [3:0] cMove,
  output logic       win,
  output logic [3:0] h3, h2, h1, h0, c3, c2, c1, c0,
  input  logic [3:0] hMove,
  input  logic       clock, reset, enter, newGame);

  // C_1_2_H_3_4_E_I means that
  // computer's move: 1, 2
  // human move: 3, 4
  // enter pressed
  // this is an invalid move
  // 'W' means that computer wins
  // 'N' means that newGame pressed
  enum logic [5:0] {
                    C_5 = 6'd0,
                    C_5_I = 6'd1,
                    C_5_H_6_E = 6'd2,
                    C_1_5_H_6 = 6'd3,
                    C_1_5_H_6_I = 6'd4,
                    C_1_5_H_2_6_E = 6'd5,
                    C_1_5_H_3_6_E = 6'd6,
                    C_1_5_H_4_6_E = 6'd7,
                    C_1_5_H_6_7_E = 6'd8,
                    C_1_5_H_6_8_E = 6'd9,
                    C_1_5_H_6_9_E = 6'd10,
                    C_1_5_9_H_2_6_W = 6'd11,
                    C_1_5_9_H_2_6_W_N = 6'd12,
                    C_1_5_9_H_3_6_W = 6'd13,
                    C_1_5_9_H_3_6_W_N = 6'd14,
                    C_1_5_9_H_4_6_W = 6'd15,
                    C_1_5_9_H_4_6_W_N = 6'd16,
                    C_1_5_9_H_6_7_W = 6'd17,
                    C_1_5_9_H_6_7_W_N = 6'd18,
                    C_1_5_9_H_6_8_W = 6'd19,
                    C_1_5_9_H_6_8_W_N = 6'd20,
                    C_1_3_5_H_6_9 = 6'd21,
                    C_1_3_5_H_6_9_I = 6'd22,
                    C_1_3_5_H_2_6_9_E = 6'd23,
                    C_1_3_5_H_4_6_9_E = 6'd24,
                    C_1_3_5_H_6_7_9_E = 6'd25,
                    C_1_3_5_H_6_8_9_E = 6'd26,
                    C_1_2_3_5_H_4_6_9_W = 6'd27,
                    C_1_2_3_5_H_4_6_9_W_N = 6'd28,
                    C_1_2_3_5_H_6_7_9_W = 6'd29,
                    C_1_2_3_5_H_6_7_9_W_N = 6'd30,
                    C_1_2_3_5_H_6_8_9_W = 6'd31,
                    C_1_2_3_5_H_6_8_9_W_N = 6'd32,
                    C_1_3_5_7_H_2_6_9_W = 6'd33,
                    C_1_3_5_7_H_2_6_9_W_N = 6'd34
                   } currState, nextState;
   // register
  always_ff @(posedge clock, posedge reset)
    if (reset)
      currState <= C_5;
    else
      currState <= nextState;

  // next state generation
  always_comb begin
    unique case (currState)
      C_5: begin
        if (enter) begin
          if (hMove != 4'd6)
            nextState = C_5_I;
          else
            nextState = C_5_H_6_E;
        end
		  else
		    nextState = C_5;    	
      end
      C_1_5_H_6: begin
        if (enter)
          unique case (hMove)
            4'd1,
            4'd5,
            4'd6: nextState = C_1_5_H_6_I;
            4'd2: nextState = C_1_5_H_2_6_E;
            4'd3: nextState = C_1_5_H_3_6_E;
            4'd4: nextState = C_1_5_H_4_6_E;
            4'd7: nextState = C_1_5_H_6_7_E;
            4'd8: nextState = C_1_5_H_6_8_E;
            4'd9: nextState = C_1_5_H_6_9_E;
          endcase
        else
          nextState = C_1_5_H_6;
      end
      C_1_3_5_H_6_9:
        if (enter)
          unique case (hMove)
            4'd1,
            4'd3,
            4'd5,
            4'd6,
            4'd9: nextState = C_1_3_5_H_6_9_I;
            4'd2: nextState = C_1_3_5_H_2_6_9_E;
            4'd4: nextState = C_1_3_5_H_4_6_9_E;
            4'd7: nextState = C_1_3_5_H_6_7_9_E;
            4'd8: nextState = C_1_3_5_H_6_8_9_E;
          endcase
        else
          nextState = C_1_3_5_H_6_9;
      C_5_H_6_E:
        if (~enter)
          nextState = C_1_5_H_6;
        else
          nextState = C_5_H_6_E;
      C_1_5_H_2_6_E:
        if (~enter)
          nextState = C_1_5_9_H_2_6_W;
        else
          nextState = C_1_5_H_2_6_E;
      C_1_5_H_3_6_E:
        if (~enter)
          nextState = C_1_5_9_H_3_6_W;
        else
          nextState = C_1_5_H_3_6_E;
      C_1_5_H_4_6_E:
        if (~enter)
          nextState = C_1_5_9_H_4_6_W;
        else
          nextState = C_1_5_H_4_6_E;
      C_1_5_H_6_7_E:
        if (~enter)
          nextState = C_1_5_9_H_6_7_W;
        else
          nextState = C_1_5_H_6_7_E;
      C_1_5_H_6_8_E:
        if (~enter)
          nextState = C_1_5_9_H_6_8_W;
        else
          nextState = C_1_5_H_6_8_E;
      C_1_5_H_6_9_E:
        if (~enter)
          nextState = C_1_3_5_H_6_9;
        else
          nextState = C_1_5_H_6_9_E;
      C_1_3_5_H_2_6_9_E:
        if (~enter)
          nextState = C_1_3_5_7_H_2_6_9_W;
        else
          nextState = C_1_3_5_H_2_6_9_E;
      C_1_3_5_H_4_6_9_E:
        if (~enter)
          nextState = C_1_2_3_5_H_4_6_9_W;
        else
          nextState = C_1_3_5_H_4_6_9_E;
      C_1_3_5_H_6_7_9_E:
        if (~enter)
          nextState = C_1_2_3_5_H_6_7_9_W;
        else
          nextState = C_1_3_5_H_6_7_9_E;
      C_1_3_5_H_6_8_9_E:
        if (~enter)
          nextState = C_1_2_3_5_H_6_8_9_W;
        else
          nextState = C_1_3_5_H_6_8_9_E;

      C_1_5_9_H_2_6_W:
        if (newGame)
          nextState = C_1_5_9_H_2_6_W_N;
        else
          nextState = C_1_5_9_H_2_6_W;
      C_1_5_9_H_3_6_W:
        if (newGame)
          nextState = C_1_5_9_H_3_6_W_N;
        else
          nextState = C_1_5_9_H_3_6_W;
      C_1_5_9_H_4_6_W:
        if (newGame)
          nextState = C_1_5_9_H_4_6_W_N;
        else
          nextState = C_1_5_9_H_4_6_W;
      C_1_5_9_H_6_7_W:
        if (newGame)
          nextState = C_1_5_9_H_6_7_W_N;
        else
          nextState = C_1_5_9_H_6_7_W;
      C_1_5_9_H_6_8_W:
        if (newGame)
          nextState = C_1_5_9_H_6_8_W_N;
        else
          nextState = C_1_5_9_H_6_8_W;
      C_1_3_5_7_H_2_6_9_W:
        if (newGame)
          nextState = C_1_3_5_7_H_2_6_9_W_N;
        else
          nextState = C_1_3_5_7_H_2_6_9_W;
      C_1_2_3_5_H_4_6_9_W:
        if (newGame)
          nextState = C_1_2_3_5_H_4_6_9_W_N;
        else
          nextState = C_1_2_3_5_H_4_6_9_W;
      C_1_2_3_5_H_6_7_9_W:
        if (newGame)
          nextState = C_1_2_3_5_H_6_7_9_W_N;
        else
          nextState = C_1_2_3_5_H_6_7_9_W;
      C_1_2_3_5_H_6_8_9_W:
        if (newGame)
          nextState = C_1_2_3_5_H_6_8_9_W_N;
        else
          nextState = C_1_2_3_5_H_6_8_9_W;

      C_5_I:
        if (~enter)
          nextState = C_5;
        else
          nextState = C_5_I;
      C_1_5_H_6_I:
        if (~enter)
          nextState = C_5;
        else
          nextState = C_1_5_H_6_I;
      C_1_3_5_H_6_9_I:
        if (~enter)
          nextState = C_5;
        else
          nextState = C_1_3_5_H_6_9_I;

      C_1_5_9_H_2_6_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_5_9_H_2_6_W_N;
      C_1_5_9_H_3_6_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_5_9_H_3_6_W_N;
      C_1_5_9_H_4_6_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_5_9_H_4_6_W_N;
      C_1_5_9_H_6_7_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_5_9_H_6_7_W_N;
      C_1_5_9_H_6_8_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_5_9_H_6_8_W_N;
      C_1_2_3_5_H_4_6_9_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_2_3_5_H_4_6_9_W_N;
      C_1_2_3_5_H_6_7_9_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_2_3_5_H_6_7_9_W_N;
      C_1_2_3_5_H_6_8_9_W_N:
        if (~newGame)
          nextState = C_5;
		  else
		    nextState = C_1_2_3_5_H_6_8_9_W_N;
      C_1_3_5_7_H_2_6_9_W_N:
        if (~newGame)
          nextState = C_5;
        else
          nextState = C_1_3_5_7_H_2_6_9_W_N;

      default: nextState = C_5;
    endcase
  end



always_comb begin
	 cMove = 4'b0000;
	 win = 1'b1;
     {c3, c2, c1, c0, h3, h2, h1, h0} = 32'b0;
    if (currState == C_5) begin
      cMove = 4'h5;
      win = 0;
      c3 = 4'd5;
    end

    if (currState == C_5_I) begin
      cMove = 4'h5;
      win = 0;
      c3 = 4'd5;
    end

    if (currState == C_5_H_6_E) begin
      cMove = 4'h5;
      win = 0;
      c3 = 4'd5;
    end

    if (currState == C_1_5_H_6) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end

    if (currState == C_1_5_H_6_I) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end


    if (currState == C_1_5_H_2_6_E) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end
    if (currState == C_1_5_H_3_6_E) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end
    if (currState == C_1_5_H_4_6_E) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end
    if (currState == C_1_5_H_6_7_E) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end
    if (currState == C_1_5_H_6_8_E) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end
    if (currState == C_1_5_H_6_9_E) begin
      cMove = 4'h1;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd5;
      h3 = 4'd6;
    end


    if (currState == C_1_5_9_H_2_6_W) begin
      cMove = 4'h7;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd2;
      h2 = 4'd6;
    end
    if (currState == C_1_5_9_H_2_6_W_N) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd2;
      h2 = 4'd6;
    end

    if (currState == C_1_5_9_H_3_6_W) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd7;
      h3 = 4'd3;
      h2 = 4'd6;
    end
    if (currState == C_1_5_9_H_3_6_W_N) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd3;
      h2 = 4'd6;
    end

    if (currState == C_1_5_9_H_4_6_W) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd4;
      h2 = 4'd6;
    end
    if (currState == C_1_5_9_H_4_6_W_N) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd4;
      h2 = 4'd6;
    end

    if (currState == C_1_5_9_H_6_7_W) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd6;
      h2 = 4'd7;
    end
    if (currState == C_1_5_9_H_6_7_W_N) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd6;
      h2 = 4'd7;
    end



    if (currState == C_1_5_9_H_6_8_W) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd6;
      h2 = 4'd8;
    end
    if (currState == C_1_5_9_H_6_8_W_N) begin
      cMove = 4'h9;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd5;
      c1 = 4'd9;
      h3 = 4'd6;
      h2 = 4'd8;
    end


    if (currState == C_1_3_5_H_6_9) begin
      cMove = 4'h3;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd9;
    end
    if (currState == C_1_3_5_H_6_9_I) begin
      cMove = 4'h3;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd9;
    end

    if (currState == C_1_3_5_H_2_6_9_E) begin
      cMove = 4'h3;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      h3 = 4'd2;
      h2 = 4'd6;
      h1 = 4'd9;
    end

    if (currState == C_1_3_5_H_4_6_9_E) begin
      cMove = 4'h3;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      h3 = 4'd4;
      h2 = 4'd6;
      h1 = 4'd9;
    end

    if (currState == C_1_3_5_H_6_7_9_E) begin
      cMove = 4'h3;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd7;
      h1 = 4'd9;
    end

    if (currState == C_1_3_5_H_6_8_9_E) begin
      cMove = 4'h3;
      win = 0;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;			
      h3 = 4'd6;
      h2 = 4'd8;
      h1 = 4'd9;
    end

    if (currState == C_1_2_3_5_H_4_6_9_W) begin
      cMove = 4'h2;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd2;
      c1 = 4'd3;
      c0 = 4'd5;
      h3 = 4'd4;
      h2 = 4'd6;
      h1 = 4'd9;
    end

    if (currState == C_1_2_3_5_H_4_6_9_W_N) begin
      cMove = 4'h2;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd2;
      c1 = 4'd3;
      c0 = 4'd5;
      h3 = 4'd4;
      h2 = 4'd6;
      h1 = 4'd9;
    end

    if (currState == C_1_2_3_5_H_6_7_9_W) begin
      cMove = 4'h2;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd2;
      c1 = 4'd3;
      c0 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd7;
      h1 = 4'd9;
    end

    if (currState == C_1_2_3_5_H_6_7_9_W_N) begin
      cMove = 4'h2;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd2;
      c1 = 4'd3;
      c0 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd7;
      h1 = 4'd9;

    end

    if (currState == C_1_2_3_5_H_6_8_9_W) begin
      cMove = 4'h2;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd2;
      c1 = 4'd3;
      c0 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd8;
      h1 = 4'd9;
    end

    if (currState == C_1_2_3_5_H_6_8_9_W_N) begin
      cMove = 4'h2;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd2;
      c1 = 4'd3;
      c0 = 4'd5;
      h3 = 4'd6;
      h2 = 4'd8;
      h1 = 4'd9;

    end

    if (currState == C_1_3_5_7_H_2_6_9_W) begin
      cMove = 4'h7;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      c0 = 4'd7;
      h3 = 4'd2;
      h2 = 4'd6;
      h1 = 4'd9;
    end

    if (currState == C_1_3_5_7_H_2_6_9_W_N) begin
      cMove = 4'h7;
      win = 1;
      c3 = 4'd1;
      c2 = 4'd3;
      c1 = 4'd5;
      c0 = 4'd7;
      h3 = 4'd2;
      h2 = 4'd6;
      h1 = 4'd9;
    end
  end

endmodule: task5


module task5_test ();
  logic [3:0] cMove;
  logic       win;
  logic [3:0] h3, h2, h1, h0, c3, c2, c1, c0;
  logic [3:0] hMove;
  logic       clock, reset, enter, newGame;

  // C_1_2_H_3_4_E_I means that
  // computer's move: 1, 2
  // human move: 3, 4
  // enter pressed
  // this is an invalid move
  // 'W' means that computer wins
  // 'N' means that newGame pressed
    task5 dut(.*);

    initial begin
        $monitor ($stime,, "h3:%d, h2:%d, h1:%d, h0:%d, c3:%d, c2:%d, c1:%d, c0:%d, hMove: %d cMove: %d newGame: %b reset: %b enter: %b, win:%b, state: %s, nextState: %s", h3, h2, h1, h0, c3, c2, c1, c0, hMove, cMove, newGame, reset, enter, win, dut.currState.name, dut.nextState.name, );
        // $monitor ($stime,, "state:%s, nextstate:%s,{c3:%d, c2:%d, c1:%d, h0:%d,
        //  h3:%d, h2:%d, h1:%d, h0:%d}, cMove:%d, hMove:%d, enter:%b, newGame:%b, 
        //  reset: %b, win:%b",
        //  dut.currState.name, dut.nextState.name, {c3, c2, c1, c0, h3, h2, h1, h0}, 
        //  cMove, hMove, enter, newGame, reset, win);
        clock = 1'b0;
        reset <= 1'b1;
        reset <= 1'b0;
        newGame = 1'b0;
        enter = 1'b0;
        
        forever #5 clock = ~clock;
    end
    initial begin
        // TB testing order
        // C_5 Tests
            // C_5_I tests

        //Section 1 Tests ( CMOVE 1,3,5, HMOVE: 6,9)
        // C_1_5_H_6 Test
            // C_1_5_H_6_I tests
                // C_1_5_H_6_9_E
                    // C_1_3_5_H_6_9 Tests
                        // C_1_3_5_H_6_9_I test

                            //section 1a (hMove:2)
                                // C_1_3_5_H_2_6_9_E
                                // C_1_3_5_7_H_2_6_9_W
                                // C_1_3_5_7_H_2_6_9_W_N
                            //section 1b (hMove: 4)
                                //C_1_3_5_H_4_6_9_E
                                //C_1_2_3_5_H_4_6_9_W
                                //C_1_2_3_5_H_4_6_9_W_N
                            //section 1c (hMove: 7)
                                //C_1_3_5_H_6_7_9_E
                                //C_1_2_3_5_H_6_7_9_W
                                //C_1_2_3_5_H_6_7_9_W_N
                            //section 1d (hMove: 8)
                                //C_1_3_5_H_6_8_9_E
                                //C_1_2_3_5_H_6_8_9_W
                                //C_1_2_3_5_H_6_8_9_W_N






        //C_5 TESTS

        //C_5_I test INVALID 
        hMove = 4'd3; // invalid
        enter = 1'b1; 
        #5                  // dont know if need this?
        enter = 1'b0; // release enter

        #5 
        //c_5_H_6_E Valid 6 move
        hMove = 4'd6;
        enter = 1'b1;
        #5


        //SECTION ONE TESTING START
        //C_1_5_H_6 TESTS 
        enter = 1'b0;
        #5 

        //C_1_5_H_6_I invalid

        hMove = 4'd5;
        enter = 1'b1;
        #5 
        enter = 1'b0;


        //C_1_5_H_6_9_E

        hMove = 4'd9;
        enter = 1'b1;
        hMove = 4'd3; // test that enter isnt affected
        #5
        //C_1_3_5_H_6_9 TESTS
        enter = 1'b0;
        #5

        //C_1_3_5_H_6_9_I test
        hMove = 4'd1;
        enter = 1'b1;
        #5
        enter = 1'b0;

        //SECTION 1A (hMove = 2 TETS)

        //C_1_3_5_H_2_6_9_E
        hMove = 4'd2;
        enter = 1'b1;
        #5
        //C_1_3_5_7_H_2_6_9_W
        enter = 1'b0;
        //C_1_3_5_7_H_2_6_9_WN
        newGame = 1'b1;
        #5
        newGame = 1'b0;

        //




        $finish;
    end








endmodule: task5_test
