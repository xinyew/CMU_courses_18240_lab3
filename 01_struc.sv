`default_nettype none

module dFlipFlop(
  output logic q,
  input  logic d, clock, reset);

  always_ff @(posedge clock)
    if (reset == 1'b1)
      q <= 0;
    else
      q <= d;

endmodule : dFlipFlop

//  --------------------------------------------------------
// |        |  Q2  Q1  Q0  |  desciption
// | -------|--------------|------------------------------------
// | State1 |   0   0   0  |  computer #5:
// | State2 |   0   0   1  |  computer #1, #5;
// | State3 |   0   1   0  |  computer #1, #5, #9;     win
// | State4 |   0   1   1  |  computer #1, #3, #5;     win
// | State5 |   1   0   0  |  computer #1, #2, #3, #7; win
// | State6 |   1   0   1  |  computer #1, #3, #5, #7; win
//  --------------------------------------------------------

module myExplicitFSM(
  output logic [3:0] cMove,
  output logic       win,
  output logic       q0, q1, q2,
  input  logic [3:0] hMove,
  input  logic       clock, reset);

  logic d0, d1, d2;

  // flip-flops instantiation
  dFlipFlop ff0(.d(d0),
                .q(q0),
                .clock(clock),
                .reset(reset)),
            ff1(.d(d1),
                .q(q1),
                .clock(clock),
                .reset(reset)),
            ff2(.d(d2),
                .q(q2),
                .clock(clock),
                .reset(reset));

  // next state generation
  assign d2 = ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) | 
              ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              ((~q2) & q1 & q0 & (~hMove[3]) & hMove[2] & hMove[1] & hMove[0]) |
              ((~q2) & q1 & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & (~hMove[0])) |

              (q2 & (~q1) & (~q0) & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              (q2 & (~q1) & (~q0) & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              (q2 & (~q1) & (~q0) & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              (q2 & (~q1) & (~q0) & (~hMove[3]) & hMove[2] & (~hMove[1]) & (~hMove[0])) |
              (q2 & (~q1) & (~q0) & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              (q2 & (~q1) & (~q0) & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |
              (q2 & (~q1) & (~q0) & (~hMove[3]) & hMove[2] & hMove[1] & hMove[0]) |
              (q2 & (~q1) & (~q0) & hMove[3] & (~hMove[2]) & (~hMove[1]) & (~hMove[0])) |
              (q2 & (~q1) & (~q0) & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]) |

              (q2 & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              (q2 & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              (q2 & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & (~hMove[0])) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & hMove[1] & hMove[0]) |
              (q2 & (~q1) & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & (~hMove[0])) |
              (q2 & (~q1) & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]);

  assign d1 = ((~q2) & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              ((~q2) & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              ((~q2) & (~q1) & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & (~hMove[0])) |
              ((~q2) & (~q1) & q0 & (~hMove[3]) & hMove[2] & hMove[1] & hMove[0]) |
              ((~q2) & (~q1) & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & (~hMove[0])) |
              ((~q2) & (~q1) & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]) |

              ((~q2) & q1 & (~q0) & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              ((~q2) & q1 & (~q0) & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              ((~q2) & q1 & (~q0) & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              ((~q2) & q1 & (~q0) & (~hMove[3]) & hMove[2] & (~hMove[1]) & (~hMove[0])) |
              ((~q2) & q1 & (~q0) & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              ((~q2) & q1 & (~q0) & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |
              ((~q2) & q1 & (~q0) & (~hMove[3]) & hMove[2] & hMove[1] & hMove[0]) |
              ((~q2) & q1 & (~q0) & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & (~hMove[0])) |
              ((~q2) & q1 & (~q0) & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]) |

              ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              ((~q2) & q1 & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              ((~q2) & q1 & q0 & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |
              ((~q2) & q1 & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]);

  assign d0 = ((~q2) & (~q1) & (~q0) & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |

              ((~q2) & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              ((~q2) & (~q1) & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              ((~q2) & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |


              ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              ((~q2) & q1 & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              ((~q2) & q1 & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              ((~q2) & q1 & q0 & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |
              ((~q2) & q1 & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]) |

              (q2 & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & (~hMove[1]) & hMove[0]) |
              (q2 & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & (~hMove[0])) |
              (q2 & (~q1) & q0 & (~hMove[3]) & (~hMove[2]) & hMove[1] & hMove[0]) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & (~hMove[0])) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & (~hMove[1]) & hMove[0]) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & hMove[1] & (~hMove[0])) |
              (q2 & (~q1) & q0 & (~hMove[3]) & hMove[2] & hMove[1] & hMove[0]) |
              (q2 & (~q1) & q0 & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & (~hMove[0])) |
              (q2 & (~q1) & q0 & hMove[3] & (~hMove[2]) & (~hMove[1]) & hMove[0]);

  // output logic generation
  assign cMove[3] = (~q2) & q1 & (~q0);

  assign cMove[2] = ((~q2) & (~q1) & (~q0)) |
                    (q2 & (~q1) & q0);

  assign cMove[1] = ((~q2) & q1 & q0) |
                    (q2 & (~q1) & (~q0)) |
                    (q2 & (~q1) & q0);

  assign cMove[0] = ((~q2) & (~q1) & (~q0)) |
                    ((~q2) & (~q1) & q0) |
                    ((~q2) & q1 & (~q0)) |
                    ((~q2) & q1 & q0) |
                    (q2 & (~q1) & q0);
 
  assign win = ((~q2) & q1 & (~q0)) |
               (q2 & (~q1) & (~q0)) |
               (q2 & (~q1) & q0);

endmodule : myExplicitFSM

