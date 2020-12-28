`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 12:28:02 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,
    input enableWrite,
    input reg [7:0] writeIn,
    input reg [1:0] regASel,
    input reg [1:0] regBSel,
    output reg [7:0] regAOut,
    output reg [7:0] regBOut
    );
    
    reg [7:0] mem[0:3];

    always @(posedge clk) begin
        if(enableWrite) begin
            mem[regASel] <= writeIn;    
        end
        regAOut <= mem[regASel];
        regBOut <= mem[regBSel];
    end

endmodule
