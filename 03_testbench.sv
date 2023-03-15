`default_nettype none

module testBench();
    logic [3:0] cMove, hMove;
    logic clock, reset, win;
    myAbstractFSM dut1(.clock(clock),
                       .reset(reset),
                       .win(win),
                       .cMove(cMove),
                       .hMove(hMove));
    
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        $monitor($time,, "state=%s, cMove=%d, hMove=%d, win=%b",
                 dut1.currState.name, cMove, hMove, win);
        // initialize values
        hMove <= 4'hF; 
        reset <= 1'b1;

        // reset the FSM
        @(posedge clock); // wait for a positive clock edge
        @(posedge clock); // one edge is enough, but what the heck
        @(posedge clock);

        @(posedge clock); // begin cycle 0
        reset <= 1'b0; // release the reset


        // start an example sequence -- not meaningful for the lab
        hMove <= 4'h6; // these changes are after the clock edge
                        // which means the state change happens
                        // AFTER the next clock edge
        @(posedge clock); // begin cycle 1
        hMove <= 4'h1;

        
        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);

        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // 2-7 TEST
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h2;


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);

        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0;  
        //start
        hMove <= 4'h6; 
        @(posedge clock); // 7-2 TEST
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h7;


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);

        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0;  
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 9 test
        hMove <= 4'h5;


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);

        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0;  
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h4; 


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);

        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h4;  // not 6 test
        @(posedge clock); // not 
        
        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h4;  // not 6 test
        @(posedge clock); // not 



        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h4; 


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h4; 


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h2; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h3;
        @(posedge clock); 
        hMove <= 4'h9; 


        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h4; 

        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h3; 
        @(posedge clock); 
        hMove <= 4'h4; 
        
                // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h3; 
        @(posedge clock); 
        hMove <= 4'h8; 
        @(posedge clock); 

        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h3; 
        @(posedge clock); 
        hMove <= 4'h7; 
        @(posedge clock); 
        hMove <= 4'h4; 
        @(posedge clock); 

        // reset the FSM
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 
        //start
        hMove <= 4'h6; 
        @(posedge clock); // not 7-2 test
        hMove <= 4'h9;
        @(posedge clock); 
        hMove <= 4'h3; 
        @(posedge clock); 
        hMove <= 4'h2; 
        @(posedge clock); 
        hMove <= 4'h4; 
        @(posedge clock); 
        
        @(posedge clock); 
        @(posedge clock); 
        @(posedge clock);
        reset <= 1'b1;
        @(posedge clock); 
        reset <= 1'b0; 

        #1 $finish;
    end

endmodule : testBench


module myFSM_test(
    input logic [3:0] cMove,
    input logic win,
    input logic q2, q1, q0,
    output logic [3:0] hMove,
    output logic clock, reset);



    
endmodule: myFSM_test
