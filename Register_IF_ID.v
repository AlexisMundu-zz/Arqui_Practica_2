/******************************************************************
* Description
*	This is a register that corresponds to the Instruction and PC + 4. 
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

module Register_IF_ID
#(
	parameter N=32
)
(
	input clk,
	input reset,
	input  [N-1:0] PC_4,
	input  [N-1:0] Instruction,
	
	
	output reg [N-1:0] PC_4_out,
	output reg [N-1:0] Instruction_out
);

always@(negedge reset or posedge clk) begin
	if(reset==0)
		begin
			PC_4_out <= 0;
			Instruction_out <= 0;
		end
	else	
		begin
			PC_4_out<=PC_4;
			Instruction_out<=Instruction;
		end
end

endmodule
//pcreg//