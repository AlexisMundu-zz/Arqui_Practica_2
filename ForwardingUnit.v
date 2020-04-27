/******************************************************************
* Description
*	This is the module that will be in charge of doing the forwarding of data when
*	there is the need of requiring a register that still doesn't have the value in the register file
* Version:
*	1.0
* Author:
*	Alexis Muñoz
* email:
*	is713743@iteso.mx
* Date:
*	26/04/2020
******************************************************************/

module ForwardingUnit
(
	input clk,
	input reset,
	input EX_MEM_RegWrite,
	input MEM_WB_RegWrite,
	input [4:0] Rs,
	input [4:0] Rt,
	input [4:0] EX_MEM_Rd,
	input [4:0] MEM_WB_Rd,
	
	output [1:0] ForwardA,
	output [1:0] ForwardB
);

assign ForwardA = EX_MEM_RegWrite & EX_MEM_Rd != 0 & EX_MEM_Rd == Rs ? 2'b10 : MEM_WB_RegWrite & MEM_WB_Rd != 0 & MEM_WB_Rd == Rs? 2'b01 : 2'b00;

assign ForwardB = MEM_WB_RegWrite & MEM_WB_Rd != 0 & MEM_WB_Rd == Rt ? 2'b10 : MEM_WB_RegWrite & MEM_WB_Rd != 0 & MEM_WB_Rd == Rt? 2'b01 : 2'b00;


endmodule