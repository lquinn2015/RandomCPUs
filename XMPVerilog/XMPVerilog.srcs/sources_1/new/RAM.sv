`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 07:10:41 PM
// Design Name: 
// Module Name: RAM
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


module RAM(
    input wire clk,
    input wire mem_write,
    input wire mem_read,
    input reg [7:0] mem_write_data,
    input reg [7:0] mem_addr,
    output reg [7:0] mem_out,
    
    input wire debug,
    input wire [7:0] mem_debug_sel,
    output reg [7:0] mem_debug_out
    );
    
    reg [7:0] mem[256];
    
    integer i;
    initial begin
        for(i=0; i<256; i=i+1)
            mem[i] <= i;
    end

    assign mem_out = (mem_read == 1'b1) ? mem[mem_addr] : 16'd0;
    
    always @(posedge clk) begin
        
        if(mem_write) begin
            mem[mem_addr] <= mem_write_data;
        end
        
//        if(debug)
            mem_debug_out <= mem[mem_debug_sel];
        
    end
    
endmodule
