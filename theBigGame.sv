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
      C_5_I
    endcase
  end

  
  // output generation
  always_comb begin
	 cMove = 4'b0000;
	 win = 1'b1;
    if (currState == S0) begin
      cMove = 4'h5;
      win = 0;
    end
    if (currState == S1) begin
      cMove = 4'h1;
      win = 0;
    end
    if (currState == S2) begin
      cMove = 4'h9;
      win = 1;
    end
    if (currState == S3) begin
      cMove = 4'h3;
      win = 0;
    end
    if (currState == S4) begin
      cMove = 4'h2;
      win = 1;
    end
    if (currState == S5) begin
      cMove = 4'h7;
      win = 1;
    end
  end

  // register
  always_ff @(posedge clock)
    if (reset)
      currState <= S0;
    else
      currState <= nextState;

endmodule: task5
    
