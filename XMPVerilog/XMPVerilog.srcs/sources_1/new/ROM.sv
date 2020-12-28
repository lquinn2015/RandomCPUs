`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2020 07:19:27 PM
// Design Name: 
// Module Name: ROM
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


module ROM(
    input clk,
    input [7:0] addr,
    output reg [7:0] out
    );
    
    reg [7:0] mem[256];
    initial begin
        
        $readmemh("fib.h-fpga.mem", mem, 0);
    end
    
    always @(posedge clk) begin
        out <= mem[addr];
    end
    
    
    
    
    
endmodule
