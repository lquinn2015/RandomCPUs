`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2020 02:31:59 PM
// Design Name: 
// Module Name: MUX
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

parameter SEL_SIZE = 2;
parameter INPUT_SIZE = 8;

module MUX
    (
        output logic [INPUT_SIZE-1 : 0] o_data,
        input  logic [SEL_SIZE-1:0] select,
        input logic [INPUT_SIZE-1:0]  i_data [SEL_SIZE*SEL_SIZE]
    );
    
    assign o_data = i_data[select];  
    
endmodule
