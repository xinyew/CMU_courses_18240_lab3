module SevenSegmentDisplay
  (input  logic [3:0] BCX,
   input  logic [7:0] blank,
   output logic [6:0] HEX);

  always_comb begin
    HEX = 7'b0000000;
    if (~blank[0])
      case (BCX)
        4'h0: HEX = 7'b0111111;
        4'h1: HEX = 7'b0000110;
        4'h2: HEX = 7'b1011011;
        4'h3: HEX = 7'b1001111;
        4'h4: HEX = 7'b1100110;
        4'h5: HEX = 7'b1101101;
        4'h6: HEX = 7'b1111101;
        4'h7: HEX = 7'b0000111;
        4'h8: HEX = 7'b1111111;
        4'h9: HEX = 7'b1100111;
        4'ha: HEX = 7'b1110111;
        4'hb: HEX = 7'b1111100;
        4'hc: HEX = 7'b0111001;
        4'hd: HEX = 7'b1011110;
        4'he: HEX = 7'b1111001;
        4'hf: HEX = 7'b1110001;
        default: HEX = 7'b0000000;
      endcase
    HEX = ~HEX;
  end


endmodule : SevenSegmentDisplay
