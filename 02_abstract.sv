`default_nettype none

module myAbstractFSM (
  output logic [3:0] cMove,
  output logic       win,
  input  logic [3:0] hMove,
  input  logic       clock, reset);

  enum logic [2:0] {S0 = 3'b000, S1 = 3'b001,
                    S2 = 3'b010, S3 = 3'b011, 
                    S4 = 3'b100, S5 = 3'b101} currState, nextState;

  // next state generation
  always_comb
    unique case (currState)
      S0: 
        nextState = (hMove == 4'h6) ? S1 : S0;
      S1: begin
        if (hMove == 4'h1 || hMove == 4'h5 || hMove == 4'h6)
          nextState = S1;
        else
          nextState = (hMove == 4'h9) ? S3 : S2;
      end
      S2:
        nextState = S2;
      S3: begin
        if (hMove == 4'h1 || hMove == 4'h4 || hMove == 4'h5 || hMove == 4'h6 
        || hMove == 4'h9)
          nextState = S3;
        else
            nextState = (hMove == 4'h2) ? S5 : S4;
      end
      S4:
        nextState = S4;
      S5:
        nextState = S5;
    endcase

  
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

endmodule: myAbstractFSM
    
