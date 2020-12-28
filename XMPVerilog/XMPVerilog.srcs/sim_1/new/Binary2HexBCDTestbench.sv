`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2020 10:22:08 AM
// Design Name: 
// Module Name: Binary2HexBCDTestbench
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


module Binary2HexBCDTestbench(

    );
    
    reg clk = 1;
    reg [3:0] number;
    reg [6:0] bcd;
    
    Binary2HexBCD tester (
        .clk(clk),
        .binnum(number),
        .bcd(bcd)
        );
    
    initial begin
        for (int i = 0; i < 16; i=i+1) begin
            number = i;
            #10;         
        end
    end
    
    always
    begin
        #5 clk = ~clk;
    end
    
endmodule
