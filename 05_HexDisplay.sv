`default_nettype none

module SevenSegmentDisplay
  (input  logic [3:0] BCX0,
   input  logic [7:0] blank,
   output logic [6:0] HEX0);

  always_comb begin
    HEX0 = 7'b0000000;
    if (~blank[0])
      case (BCX0)
        4'h0: HEX0 = 7'b0111111;
        4'h1: HEX0 = 7'b0000110;
        4'h2: HEX0 = 7'b1011011;
        4'h3: HEX0 = 7'b1001111;
        4'h4: HEX0 = 7'b1100110;
        4'h5: HEX0 = 7'b1101101;
        4'h6: HEX0 = 7'b1111101;
        4'h7: HEX0 = 7'b0000111;
        4'h8: HEX0 = 7'b1111111;
        4'h9: HEX0 = 7'b1100111;
        4'ha: HEX0 = 7'b1110111;
        4'hb: HEX0 = 7'b1111100;
        4'hc: HEX0 = 7'b0111001;
        4'hd: HEX0 = 7'b1011110;
        4'he: HEX0 = 7'b1111001;
        4'hf: HEX0 = 7'b1110001;
        default: HEX0 = 7'b0000000;
      endcase
    HEX0 = ~HEX0;
  end


endmodule : SevenSegmentDisplay