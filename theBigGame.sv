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
       
      C_5_H_6_E:
        if (~enter)
          nextState = C_1_5_H_6;
      C_1_5_H_2_6_E:
        if (~enter)
          nextState = C_1_5_9_H_2_6_W;
      C_1_5_H_3_6_E:
        if (~enter)
          nextState = C_1_5_9_H_3_6_W;
      C_1_5_H_4_6_E:
        if (~enter)
          nextState = C_1_5_9_H_4_6_W;
      C_1_5_H_6_7_E:
        if (~enter)
          nextState = C_1_5_9_H_6_7_W;
      C_1_5_H_6_8_E:
        if (~enter)
          nextState = C_1_5_9_H_6_8_W;
      C_1_5_H_6_9_E:
        if (~enter)
          nextState = C_1_3_5_H_6_9;
      C_1_3_5_H_2_6_9_E:
        if (~enter)
          nextState = C_1_3_5_7_H_2_6_9_W;
      C_1_3_5_H_4_6_9_E:
        if (~enter)
          nextState = C_1_2_3_5_H_4_6_9_W;
      C_1_3_5_H_6_7_9_E:
        if (~enter)
          nextState = C_1_2_3_5_H_6_7_9_W;
      C_1_3_5_H_6_8_9_E:
        if (~enter)
          nextState = C_1_2_3_5_H_6_8_9_W;
      
      C_1_5_9_H_2_6_W:
        if (newGame)
          nextState = C_1_5_9_H_2_6_W_N;
      C_1_5_9_H_3_6_W:
        if (newGame)
          nextState = C_1_5_9_H_3_6_W_N;
      C_1_5_9_H_4_6_W:
        if (newGame)
          nextState = C_1_5_9_H_4_6_W_N;
      C_1_5_9_H_6_7_W:
        if (newGame)
          nextState = C_1_5_9_H_6_7_W_N;
      C_1_5_9_H_6_8_W:
        if (newGame)
          nextState = C_1_5_9_H_6_8_W_N;
      C_1_3_5_7_H_2_6_9_W:
        if (newGame)
          nextState = C_1_3_5_7_H_2_6_9_W_N;
      C_1_2_3_5_H_4_6_9_W:
        if (newGame)
          nextState = C_1_2_3_5_H_4_6_9_W_N;
      C_1_2_3_5_H_6_7_9_W:
        if (newGame)
          nextState = C_1_2_3_5_H_6_7_9_W_N;
      C_1_2_3_5_H_6_8_9_W:
        if (newGame)
          nextState = C_1_2_3_5_H_6_8_9_W_N;
      
      C_5_I,
      C_1_5_H_6_I,
      C_1_3_5_H_6_9_I:
        if (~enter)
          nextState = C_5;

      C_1_5_9_H_2_6_W_N,
      C_1_5_9_H_3_6_W_N,
      C_1_5_9_H_4_6_W_N,
      C_1_5_9_H_6_7_W_N,
      C_1_5_9_H_6_8_W_N,
      C_1_2_3_5_H_4_6_9_W_N,
      C_1_2_3_5_H_6_7_9_W_N,
      C_1_2_3_5_H_6_8_9_W_N,
      C_1_3_5_7_H_2_6_9_W_N:
        if (~newGame)
          nextState = C_5;
    endcase
  end

  
  // output generation
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


      if (currState == C_1_5_H_2_6_W) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd5;
        c1 = 4'd7;
        h3 = 4'd2;
        h2 = 4'd6;
      end
      if (currState == C_1_5_H_2_6_W_N) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd5;
        c1 = 4'd7;
        h3 = 4'd2;
        h2 = 4'd6;
      end

      if (currState == C_1_5_H_3_6_W) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd5;
        c1 = 4'd7;
        h3 = 4'd3;
        h2 = 4'd6;
      end
      if (currState == C_1_5_H_3_6_W_N) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd5;
        c1 = 4'd7;
        h3 = 4'd3;
        h2 = 4'd6;
      end

      if (currState == C_1_5_H_4_6_W) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd5;
        c1 = 4'd7;
        h3 = 4'd4;
        h2 = 4'd6;
      end
      if (currState == C_1_5_H_4_6_W_N) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd5;
        c1 = 4'd7;
        h3 = 4'd4;
        h2 = 4'd6;
      end

      if (currState == C_1_5_H_6_7_W) begin
        cMove = 4'h2;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd2;
        c1 = 4'd5;
        h3 = 4'd6;
        h2 = 4'd7;
      end
      if (currState == C_1_5_H_6_7_W_N) begin
        cMove = 4'h2;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd2;
        c1 = 4'd5;
        h3 = 4'd6;
        h2 = 4'd7;
      end



      if (currState == C_1_5_H_6_8_W) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd2;
        c1 = 4'd5;
        h3 = 4'd6;
        h2 = 4'd8;
      end
      if (currState == C_1_5_H_6_8_W_N) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd2;
        c1 = 4'd5;
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

      if (currState == C_1_3_5_H_4_6_9_W) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd3;
        c1 = 4'd5;
        c0 = 4'd7;
        h3 = 4'd4;
        h2 = 4'd6;
        h1 = 4'd9;
      end

      if (currState == C_1_3_5_H_4_6_9_W_N) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd3;
        c1 = 4'd5;
        c0 = 4'd7;
        h3 = 4'd4;
        h2 = 4'd6;
        h1 = 4'd9;
      end

      if (currState == C_1_3_5_H_6_7_9_W) begin
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

      if (currState == C_1_3_5_H_6_7_9_W_N) begin
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

      if (currState == C_1_3_5_H_6_8_9_W) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd2;
        c1 = 4'd3;
        c0 = 4'd5;
        h3 = 4'd6;
        h2 = 4'd8;
        h1 = 4'd9;
      end

      if (currState == C_1_3_5_H_6_8_9_W_N) begin
        cMove = 4'h7;
        win = 1;
        c3 = 4'd1;
        c2 = 4'd2;
        c1 = 4'd3;
        c0 = 4'd5;
        h3 = 4'd6;
        h2 = 4'd8;
        h1 = 4'd9;

      end

      if (currState == C_1_3_5_H_2_6_9_W) begin
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

      if (currState == C_1_3_5_H_2_6_9_W_N) begin
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


    // register
  always_ff @(posedge clock)
    if (reset)
      currState <= S0;
    else
      currState <= nextState;

endmodule: task5
    
