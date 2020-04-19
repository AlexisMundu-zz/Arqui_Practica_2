/******************************************************************
* Description
*	This is a register that corresponds to the MEM/WB. 
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

module Register_MEM_WB
#(
	parameter N=32
)
(
	input clk,
	input reset,
	input [N-1:0] ALU_result,
	input [N-1:0] Read_data,
	input [4:0] WriteRegister, 	
	//Control
	input MemtoReg,
	input RegWrite,
	
	
	output reg [N-1:0] ALU_result_out,
	output reg [N-1:0] Read_data_out,
	output reg [4:0] WriteRegister_out, 	
	//Control
	output reg MemtoReg_out,
	output reg RegWrite_out
);

always@(negedge reset or negedge clk) begin
	if(reset==0)
		begin
			ALU_result_out <= 0;
			Read_data_out <= 0;
			WriteRegister_out <= 0;
			//Control
			MemtoReg_out <= 0;
			RegWrite_out <= 0;
		end
	else	
		begin
			ALU_result_out <= ALU_result;
			Read_data_out <= Read_data;
			WriteRegister_out <= WriteRegister;
			//Control
			MemtoReg_out <= MemtoReg;
			RegWrite_out <= RegWrite;
		end
end

endmodule
//pcreg//