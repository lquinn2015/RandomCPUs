`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2020 03:41:38 PM
// Design Name: 
// Module Name: ALUController
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


module ALUController(
        input reg [3:0] OP,
        output reg [2:0] ALU_OP
    );
    
    parameter ALU_AND = 3'b000;
    parameter ALU_OR = 3'b001;
    parameter ALU_ADD = 3'b010;
    parameter ALU_SUB = 3'b110;
    parameter ALU_SLT = 3'b111;
    
    always_comb begin
        if(OP == 4'b0010)
            ALU_OP = ALU_ADD;
        else if (OP == 4'b0110)
            ALU_OP = ALU_SUB;
        else if (OP == 4'b0000)
            ALU_OP = ALU_AND;
        else if (OP == 4'b0001)
            ALU_OP = ALU_OR;
        else if (OP == 4'b0011)
            ALU_OP = ALU_SLT;
    end
    
endmodule
