`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 07:23:01 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
    input wire [7:0] rawOp,
    output wire jumpFlag,
    output wire branchFlag,
    output wire [1:0] memToReg,
    output wire memWriteFlag,
    output wire [1:0] ALUsrc,
    output wire regWriteFlag,
    output wire [3:0] ALUOp
    );
    
    reg [11:0] controlSigs[16];
    initial begin
        controlSigs[0] <= 12'h012;
        controlSigs[1] <= 12'h010;
        controlSigs[2] <= 12'h011;
        controlSigs[3] <= 12'h016;
        controlSigs[4] <= 12'h013;
        controlSigs[5] <= 12'h406;
        controlSigs[6] <= 12'h000;
        controlSigs[7] <= 12'h000;
        controlSigs[8] <= 12'h0a2;
        controlSigs[9] <= 12'h132;
        controlSigs[10] <= 12'h250;
        controlSigs[11] <= 12'h000;
        controlSigs[12] <= 12'h800;
        controlSigs[13] <= 12'h800;
        controlSigs[14] <= 12'h800;
        controlSigs[15] <= 12'h800;
    end 
    
    wire [2:0] op;
    assign op = rawOp[7:4];
    
    assign jumpFlag = controlSigs[op][11];
    assign branchFlag = controlSigs[op][10];
    assign memToReg = controlSigs[op][9:8];
    assign memWriteFlag = controlSigs[op][7];
    assign ALUsrc = controlSigs[op][6:5];
    assign regWriteFlag = controlSigs[op][4];
    assign ALUOp = controlSigs[op][3:0];
    
endmodule
