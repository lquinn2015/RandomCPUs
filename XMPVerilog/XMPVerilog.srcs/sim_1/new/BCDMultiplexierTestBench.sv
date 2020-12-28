`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2020 09:20:37 PM
// Design Name: 
// Module Name: BCDMultiplexierTestBench
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


module BCDMultiplexierTestBench(

    );

    reg clk = 1'b1;
    reg [3:0] num1 = 0 ;
    reg [3:0] num2;
    reg [3:0] num3;
    reg [3:0] num4;


/*    input clk,
    input [3:0] number1,
    input [3:0] number2,
    input [3:0] number3,
    input [3:0] number4,
    output [6:0] segDigit,
    output [3:0] segSel
*/

    wire [6:0] digit;
    wire [3:0] sel;

    BCDMultiplexier muxed(
        .clk(clk),
        .number1(num1),
        .number2(num2),
        .number3(num3),
        .number4(num4),
        .segDigit(digit),
        .segSel(sel)
    );

    initial begin
        for (int i = 0; i < 200; i=i+1) begin
            num1 = i % 16;
            num2 = (i + 1) % 16;
            num3 = 0;
            num4 = (i + 1) % 16;
            #10;         
        end
    end

    always
    begin
        #5 clk = ~clk;
    end

endmodule
