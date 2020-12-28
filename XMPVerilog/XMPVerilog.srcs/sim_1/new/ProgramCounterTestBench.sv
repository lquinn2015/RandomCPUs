`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2020 08:08:44 PM
// Design Name: 
// Module Name: ProgramCounterTestBench
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


module ProgramCounterTestBench(

    );
    
    reg clk = 1;
    reg [7:0] currAddr = 0;
    reg reset = 0;
    reg jump = 0;
    reg branch = 0;
    reg [5:0] jumpAddr = 10;
    reg [7:0] branchAddr = 14;
    
    /*
     input clk,
    input reset,
    input jump,
    input branch,
    input reg [5:0] jumpAddr,
    input reg [7:0] branchAddr,
    output [7:0] nextAddr
    */
    
    ProgramCounter PC(
        .clk        (clk),
        .reset      (reset),
        .jump       (jump),
        .branch     (branch),
        .jumpAddr   (jumpAddr),
        .branchAddr (branchAddr),
        .nextAddr   (currAddr)
        );
    
    
    initial begin
    for(int i = 0; i< 256; i = i + 1 ) begin
        #10
        
        if(i == 10) begin
            reset <= 1;
        end
        else if(i == 20) begin
            jump <= 1;
        end
        else if(i == 30) begin
            branch <= 1;
        end    
        else if(i == 40) begin
            branch <= 1;
            jump <= 1;
        end   
        else begin
            branch <= 0;
            jump <= 0;
            reset <= 0;
        end 

      end
    end 
    
    always
    begin
        #5 clk = ~clk;
    end

    
endmodule
