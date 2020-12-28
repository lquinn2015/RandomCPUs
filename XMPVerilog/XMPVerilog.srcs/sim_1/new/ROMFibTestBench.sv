`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/28/2020 04:33:43 PM
// Design Name: 
// Module Name: ROMFibTestBench
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


module ROMFibTestBench(

    );
    
    reg clk = 1;
    reg [7:0] addr = 0;
    reg [7:0] data;
    
    ROM rom(
        .clk(clk),
        .addr(addr),
        .out(data)
    );
    
    initial begin
        for(int i = 0; i < 13; i++) begin
            addr = i;
            #10
            addr = i;
        end
    end
    
    always begin
        #5
        clk = ~clk;
    end
    
endmodule
