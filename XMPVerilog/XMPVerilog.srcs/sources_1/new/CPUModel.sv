`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 01:22:48 PM
// Design Name: 
// Module Name: CPUModel
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


module CPUModel(
    input clk_100Mhz,
    input reset,
    input halt,
    input clkStep,
    input wire [7:0] debug_mem_sel,
    output wire [6:0] BCD_digit,
    output wire [3:0] BCD_sel
    );
    
    //Signal's by sources
    // PC   
    wire [7:0] currAddr;
    //Program Memory
    wire [7:0] instruction;
    // Controller
    wire [1:0] memToReg;
    wire memWriteFlag;
    wire [1:0] ALUsrc;
    wire regWriteFlag;
    wire [3:0] ALUCop;
    wire jumpFlag;
    wire branchFlag;
    //Registers
    wire [7:0] rd;
    wire [7:0] rs;
    // ALU SRC MUX
    wire [7:0] ALUBsrc;
    wire [7:0] zext_imm2 = {6'h0, instruction[7:6]};
    // ALU
    wire [7:0] alu_out;
    wire zeroFlag;
    // RAM     
    wire [7:0] mem_out;
    // Output MUX
    wire [7:0] write_back;
    // CLK OUT
    wire clk;
    
    // I/O controls
    wire [7:0] debug_mem_out;
    
    ClockManagement Clock (
        .clkIn          (clk_100Mhz),
        .halt           (halt),
        .step           (clkStep),
        .clkPulseOut    (clk)
    );
    
    
    ProgramCounter PC(
        .clk        (clk),
        .reset      (reset),
        .jump       (jumpFlag),
        .branch     (branchFlag & zeroFlag),
        .jumpAddr   ({instruction[7:2]}),
        .branchAddr (rd),
        .nextAddr   (currAddr) 
    );
    
    ROM programMemory(
        .clk        (clk),
        .addr       (currAddr),
        .out        (instruction)
    );
    
    Controller ControlLogic(
        .rawOp          (instruction),
        .jumpFlag       (jumpFlag),
        .branchFlag     (branchFlag),
        .memToReg       (memToReg),
        .memWriteFlag   (memWriteFlag),
        .ALUsrc         (ALUsrc),
        .regWriteFlag   (regWriteFlag),
        .ALUOp          (ALUCop)
    );
    
    
    RegisterFile regs(
        .clk            (clk),
        .enableWrite    (regWriteFlag),
        .writeIn        (write_back),
        .regASel        (instruction[5:4]),
        .regBSel        (instruction[7:6]),
        .regAOut        (rd),
        .regBOut        (rs)
    );
    
    
    MUX ALUselector(
        .o_data     (ALUBsrc),
        .select     (ALUsrc),
        .i_data     ({rs,8'd0,zext_imm2,8'd0})
    );
    

    ALU alu(
        .dA         (rd),
        .dB         (ALUBsrc),
        .OP         (ALUCop),
        .result     (alu_out),
        .zeroFlag   (zeroFlag)
    );
    
    
    RAM memory(
        .clk            (clk),
        .mem_write      (memWriteFlag),
        .mem_read       (1'b1),
        .mem_write_data (rs),
        .mem_addr       (alu_out),
        .mem_out        (mem_out),
        .debug          (1'b1),
        .mem_debug_sel  (debug_mem_sel),
        .mem_debug_out  (debug_mem_out)
    );
    
    MUX outputMux(
        .o_data     (write_back),
        .select     (memToReg),
        .i_data     ({alu_out,mem_out,zext_imm2, 8'd0})
    );
    
    // I/O  devices
    BCDMultiplexier bcd(
        .clk        (clk_100Mhz),
        .number1    (debug_mem_out[3:0]),
        .number2    (debug_mem_out[7:4]),
        .number3    (currAddr[3:0]),
        .number4    (currAddr[7:4]),
        .segDigit   (BCD_digit),
        .segSel     (BCD_sel)
    );
    
endmodule
