`default_nettype none // Required in every sv file
module chipInterface
  (input logic [0] KEY,
  input logic [17] SW,
  input logic [9:6] SW,
  output logic [6:0] HEX0,
  output logic [7:0] LEDG);
  logic [4:0] cMove;
  myAbstractFSM(.clock(KEY[0]), .reset_N(SW[17]), .hMove(SW[9:6]), .cMove(cMove));

  logic blanked = 8'b000_0000;
  SevenSegmentDisplay( .BCD0({cMove[3],cMove[2], cMove[1], cMove[0]}),
    .blank(blanked), .HEX0);

endmodule: chipInterface 


module SevenSegmentDisplay
    (input logic [3:0] BCD,
     input logic [7:0]blank,
     output logic [6:0] HEX0);

    BCDtoSevenSegment a1 (.bcd(BCD0), .blank(blank[0]), .segment(HEX0));

endmodule: SevenSegmentDisplay

module BCDtoSevenSegment
    (input logic [3:0] bcd,
     input logic blank,
     output logic [6:0] segment);
     //0-F

    always_comb begin
        if (blank==1)
            case(bcd)
                4'd0: segment = 7'b1111111;
                4'd1: segment = 7'b1111111;
                4'd2: segment = 7'b1111111;

                4'd3: segment = 7'b1111111;
                4'd4: segment = 7'b1111111;
                4'd5: segment = 7'b1111111;

                4'd6: segment = 7'b1111111;
                4'd7: segment = 7'b1111111;
                4'd8: segment = 7'b1111111;

                4'd9: segment = 7'b1111111;
            endcase
        else
            case(bcd)
                4'd0: segment = 7'b1000000;
                4'd1: segment = 7'b1111001;
                4'd2: segment = 7'b0100100;
                4'd3: segment = 7'b0110000;

                4'd4: segment = 7'b0011001;
                4'd5: segment = 7'b0010010;
                4'd6: segment = 7'b0000010;

                4'd7: segment = 7'b1111000;
                4'd8: segment = 7'b0000000;
                4'd9: segment = 7'b0011000;
            endcase
    end

endmodule: BCDtoSevenSegment
