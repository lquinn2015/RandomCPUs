`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*

match params to clock rate 
Counter = 2^N/ f_clk 
2^19/100Mhz = 50msecs 
*/
//////////////////////////////////////////////////////////////////////////////////


module DebounceButton(
        input clk,
        input button,
        output signal
    );
    parameter N = 19;
  
    reg direction = 1'b1;
    reg [N:0] counter;
    reg state = 1'b0;
    assign signal = state;
    
    always @(posedge clk) begin
        if(button)
            counter <= counter +1;
        else
            counter <= counter - 1;
        
        if(direction) begin
            if(counter > (2 << (N-1))) begin
                state =  1'b1;
                direction <= ~direction;
                end
        end
        else begin
            if(counter < N) begin
                state <= 1'b0;
                direction <= ~direction;
                end
        end
        
         
    end
  
    
endmodule
