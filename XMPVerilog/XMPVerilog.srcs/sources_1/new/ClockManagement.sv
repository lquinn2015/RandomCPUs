`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2020 09:50:28 AM
// Design Name: 
// Module Name: ClockManagement
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ClockManagement(
        input clkIn,
        input halt,
        input step,
        output reg clkPulseOut
    );
    
    reg btnPressed;
    reg stepSignal = 1'b0;
    reg internalClk; 
    
    assign clkPulseOut = internalClk;
    
    DebounceButton #(.N(19)) btn (
        .clk(clkIn),
        .button(step),
        .signal(btnPressed)
    );
    
    // only toggle button on a press not release
    always @(posedge clkIn) begin
        if (btnPressed)
            stepSignal <= ~stepSignal;
    end
    
    assign clkPulseOut = (stepSignal & halt) | (~halt & clkIn);
    
    
endmodule
