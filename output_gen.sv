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
