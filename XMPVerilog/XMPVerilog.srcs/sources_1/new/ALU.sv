`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2020 12:48:12 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] dA,
    input [7:0] dB,
    input [3:0] OP,
    output reg [7:0] result,
    output zeroFlag
    );
    
    parameter ALU_AND = 3'b000;
    parameter ALU_OR = 3'b001;
    parameter ALU_ADD = 3'b010;
    parameter ALU_SUB = 3'b110;
    parameter ALU_SLT = 3'b111;
    reg [2:0] ALU_OP;
    
    ALUController ac(
        .OP     (OP),
        .ALU_OP (ALU_OP)
    );
    
    assign zero_flag = (dB == 0 ? 1 : 0);
    
    always @(*) begin
    
        result <= 8'b0;
        case(ALU_OP) 
            ALU_AND: begin
                result <= dA & dB;
            end
            ALU_OR: begin
                result <= dA | dB;
            end
            ALU_ADD: begin
                result <= dA + dB;
            end
            ALU_SUB: begin
                result <= dA - dB; 
            end 
            ALU_SLT: begin
                result <= (dA < dB ? 7'h01 : 7'h00);
            end
            default: begin
                result <= 8'h00;
            end
                
        endcase
    end
    
 
    
endmodule
