/******************************************************************
* Description
*	This is control unit for the MIPS processor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module Control
(
	input [5:0]OP,
	
	output Jump,
	output RegDst,
	output BranchEQ,
	output BranchNE,
	output MemRead,
	output MemtoReg,
	output MemWrite,
	output ALUSrc,
	output RegWrite,
	output [2:0]ALUOp
);


// Todos los OpCodes son basados en la greencard

// El OpCode para las tipo R siempre son 0
localparam R_Type = 0;

// Las tipo I varian
localparam I_Type_ADDI 	= 6'h8;
localparam I_Type_ORI 	= 6'hd;
localparam I_Type_ANDI 	= 6'hc;
localparam I_Type_BEQ 	= 6'h4;
localparam I_Type_BNE 	= 6'h5;
localparam I_Type_LUI 	= 6'hf;
localparam I_Type_LW 	= 6'h23;
localparam I_Type_SW 	= 6'h2b;

//Las tipo J también tienen variaciones en el OpCode
localparam J_Type_J 		= 6'h2;
localparam J_Type_JAL	= 6'h3;


reg [11:0] ControlValues;

always@(OP) begin
	casex(OP)
		R_Type:       	ControlValues= 12'b0_1_001_00_00_111;
		I_Type_ADDI:	ControlValues= 12'b0_0_101_00_00_100;
		I_Type_ORI:		ControlValues= 12'b0_0_101_00_00_101;
		I_Type_ANDI:	ControlValues= 12'b0_0_101_00_00_110;
		I_Type_BEQ:		ControlValues= 12'b0_0_000_00_01_001;
		I_Type_BNE:		ControlValues= 12'b0_0_000_00_10_001;
		I_Type_LUI:		ControlValues= 12'b0_0_101_00_00_011;
		I_Type_LW:		ControlValues= 12'b0_0_111_10_00_100;
		I_Type_SW:		ControlValues= 12'b0_0_100_01_00_100;
		J_Type_J:		ControlValues= 12'b1_0_000_00_00_000;
		J_Type_JAL:		ControlValues= 12'b1_0_001_00_00_000;
		default:
			ControlValues= 10'b0000000000;
		endcase
end	
	
assign Jump 		= ControlValues[11];
assign RegDst 		= ControlValues[10];
assign ALUSrc 		= ControlValues[9];
assign MemtoReg 	= ControlValues[8];
assign RegWrite 	= ControlValues[7];
assign MemRead 	= ControlValues[6];
assign MemWrite 	= ControlValues[5];
assign BranchNE 	= ControlValues[4];
assign BranchEQ 	= ControlValues[3];
assign ALUOp 		= ControlValues[2:0];	

endmodule
//control//

