`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2020 09:57:58 AM
// Design Name: 
// Module Name: BCDMultiplexier
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


module BCDMultiplexier(
    input clk,
    input [3:0] number1,
    input [3:0] number2,
    input [3:0] number3,
    input [3:0] number4,
    output [6:0] segDigit,
    output [3:0] segSel
    );
    
    parameter SELECT_ONE = 4'b0001;
    parameter SELECT_TWO = 4'b0010;
    parameter SELECT_THREE = 4'b0100;
    parameter SELECT_FOUR = 4'b1000;
  
    reg [3:0] state = SELECT_ONE;
    reg [6:0] bcd_output = 7'h7e;
  
    wire [6:0] bcd1;
    wire [6:0] bcd2;
    wire [6:0] bcd3;
    wire [6:0] bcd4;


    //solve each BCD number
    Binary2HexBCD bcd1encoder (
        .clk(clk),
        .binnum(number1),
        .bcd(bcd1)
        );

    Binary2HexBCD bcd2encoder (
        .clk(clk),
        .binnum(number2),
        .bcd(bcd2)
        );    

    Binary2HexBCD bcd3encoder (
        .clk(clk),
        .binnum(number3),
        .bcd(bcd3)
        );

    Binary2HexBCD bcd4encoder (
        .clk(clk),
        .binnum(number4),
        .bcd(bcd4)
        );

    assign segSel = state;
    assign segDigit = (bcd1 & {7{state[0]}})   // this is a cool way to sign extend along with state selection
                      | (bcd2 & {7{state[1]}}) 
                      | (bcd3 & {7{state[2]}})
                      | (bcd4 & {7{state[3]}});

//    assign bcd_output =  //(bcd1 & (state & 7'hff))) | (bcd1 & (state >> 1))) | (bcd1 & (state >> 2))) | (bcd1 & (state >> 3)))

    // Progress each state quickly so we have a nice display
    always @(posedge clk)
    begin
        case (state)
        SELECT_ONE: begin
            state <= SELECT_TWO;
        end
        SELECT_TWO: begin
            state <= SELECT_THREE;    
        end
        SELECT_THREE: begin
            state <= SELECT_FOUR;
        end
        SELECT_FOUR: begin
            state <= SELECT_ONE;      
        end
        endcase
    end
    
    

endmodule
