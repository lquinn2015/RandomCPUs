`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2020 08:00:10 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
    input clk,
    input reset,
    input jump,
    input branch,
    input reg [5:0] jumpAddr,
    input reg [7:0] branchAddr,
    output [7:0] nextAddr
    );
    
    reg [7:0] currAddr = 0;
    
    parameter PC_JUMP = 2'b10;    
    parameter PC_BRANCH = 2'b01;
    parameter PC_STEP = 2'b00;
    
    assign nextAddr = currAddr;
    assign control = {jump, branch};
    
    always @(posedge clk) begin
    
        case(control)
        PC_STEP: begin
            currAddr <= currAddr + 1;
        end
        PC_JUMP: begin
            currAddr <= {jumpAddr, 1'b0, 1'b0};
        end
        PC_BRANCH: begin
            currAddr <= branchAddr;
        end
        endcase    
    
        if(reset)
            currAddr <= 0;
    
    end
    
endmodule
