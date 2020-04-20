/******************************************************************
* Description
*	This is a register that corresponds to the EX/MEM. 
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

module Register_EX_MEM
#(
	parameter N=32
)
(
	input clk,
	input reset,
	input Zero,
	input [N-1:0] ALU_result,
	input [N-1:0] Data_2,
	input [N-1:0] Jump_address,
	input	[N-1:0] Branch_adress,
	input [4:0] WriteRegister,
	input [N-1:0] PC_4, 	
	//Control
	input Jump,
	input BranchEQ,
	input BranchNE,
	input MemRead,
	input MemWrite,
	input MemtoReg,
	input RegWrite,
	
	input JR,
	input [N-1:0] RA_address, 
	
	
	output reg Zero_out,
	output reg [N-1:0] ALU_result_out,
	output reg [N-1:0] Data_2_out,
	output reg [N-1:0] Jump_address_out,
	output reg	[N-1:0] Branch_adress_out,
	output reg [4:0] WriteRegister_out,
	output reg [N-1:0] PC_4_out, 	
	//Control
	output reg Jump_out,
	output reg BranchEQ_out,
	output reg BranchNE_out,
	output reg MemRead_out,
	output reg MemWrite_out,
	output reg MemtoReg_out,
	output reg RegWrite_out,
	
	output reg JR_out,
	output reg [N-1:0] RA_address_out
);

always@(negedge reset or negedge clk) begin
	if(reset==0)
		begin
			Zero_out <= 0;
			ALU_result_out <= 0;
			Data_2_out <= 0;
			Jump_address_out <= 0;
			Branch_adress_out <= 0;
			WriteRegister_out <= 0;
			PC_4_out <= 0;
			//Control
			Jump_out <= 0;
			BranchEQ_out <= 0;
			BranchNE_out <= 0;
			MemRead_out <= 0;
			MemtoReg_out <= 0;
			MemWrite_out <= 0;
			RegWrite_out <= 0;
			JR_out <= 0;
			RA_address_out <= 0;
		end
	else	
		begin
			Zero_out <= Zero;
			ALU_result_out <= ALU_result;
			Data_2_out <= Data_2;
			Jump_address_out <= Jump_address;
			Branch_adress_out <= Branch_adress;
			WriteRegister_out <= WriteRegister;
			PC_4_out <= PC_4;
			//Control
			Jump_out <= Jump;
			BranchEQ_out <= BranchEQ;
			BranchNE_out <= BranchNE;
			MemRead_out <= MemRead;
			MemtoReg_out <= MemtoReg;
			MemWrite_out <= MemWrite;
			RegWrite_out <= RegWrite;
			JR_out <= JR;
			RA_address_out <= RA_address;
		end
end

endmodule
//pcreg//