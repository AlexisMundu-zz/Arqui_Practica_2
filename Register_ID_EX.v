/******************************************************************
* Description
*	This is a register that corresponds to the ID/EX. 
*	This register does not have an enable signal.
* Version:
*	1.0
* Author:
*	Alexis Muñoz
* email:
*	is713743@iteso.mx
* Date:
*	19/04/2020
******************************************************************/

module Register_ID_EX
#(
	parameter N=32
)
(
	input clk,
	input reset,
	input	[N-1:0] PC_4,
	input [N-1:0] Data_1,
	input [N-1:0] Data_2,
	input [N-1:0] Sign_extended,
	input [4:0] Rt, 	//[20-16]
	input [4:0] Rd,	//[15-11]
	input [25:0] Address,
	//Control
	input Jump,
	input RegDst,
	input BranchEQ,
	input BranchNE,
	input MemRead,
	input MemtoReg,
	input MemWrite,
	input ALUSrc,
	input RegWrite,
	input [2:0]ALUOp,
	
	
	output reg [N-1:0] PC_4_out,
	output reg [N-1:0] Data_1_out,
	output reg [N-1:0] Data_2_out,
	output reg [N-1:0] Sign_extended_out,
	output reg [4:0] Rt_out,
	output reg [4:0] Rd_out,
	output reg [25:0] Address_out,
	//Control
	output reg Jump_out,
	output reg RegDst_out,
	output reg BranchEQ_out,
	output reg BranchNE_out,
	output reg MemRead_out,
	output reg MemtoReg_out,
	output reg MemWrite_out,
	output reg ALUSrc_out,
	output reg RegWrite_out,
	output reg [2:0]ALUOp_out
);

always@(negedge reset or negedge clk) begin
	if(reset==0)
		begin
			PC_4_out <= 0;
			Data_1_out <= 0;
			Data_2_out <= 0;
			Sign_extended_out <= 0;
			Rt_out <= 0;
			Rd_out <= 0;
			Address_out <= 0;
			//Control
			Jump_out <= 0;
			RegDst_out <= 0;
			BranchEQ_out <= 0;
			BranchNE_out <= 0;
			MemRead_out <= 0;
			MemtoReg_out <= 0;
			MemWrite_out <= 0;
			ALUSrc_out <= 0;
			RegWrite_out <= 0;
			ALUOp_out <= 0;
		end
	else	
		begin
			PC_4_out <= PC_4;
			Data_1_out <= Data_1;
			Data_2_out <= Data_2;
			Sign_extended_out <= Sign_extended;
			Rt_out <= Rt;
			Rd_out <= Rd;
			Address_out <= Address;
			//Control
			Jump_out <= Jump;
			RegDst_out <= RegDst;
			BranchEQ_out <= BranchEQ;
			BranchNE_out <= BranchNE;
			MemRead_out <= MemRead;
			MemtoReg_out <= MemtoReg;
			MemWrite_out <= MemWrite;
			ALUSrc_out <= ALUSrc;
			RegWrite_out <= RegWrite;
			ALUOp_out <= ALUOp;
		end
end

endmodule
//pcreg//