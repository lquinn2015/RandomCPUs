`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2020 07:19:46 PM
// Design Name: 
// Module Name: CPUTestBench
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


module CPUTestBench(

    );


    reg clk;
    parameter PERIOD = 10;


    CPUModel cpu(
        .clk        (clk),
        .reset      (1'b0)
    );
    
    always #PERIOD clk=~clk;
    
endmodule
