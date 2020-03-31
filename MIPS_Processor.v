/******************************************************************
* Description
*	This is the top-level of a MIPS processor
* This processor is written Verilog-HDL. Also, it is synthesizable into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be execute. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
******************************************************************/


module MIPS_Processor
#(
	parameter MEMORY_DEPTH = 256
)

(
	// Inputs
	input clk,
	input reset,
	input [7:0] PortIn,
	// Output
	output [31:0] ALUResultOut,
	output [31:0] PortOut,
	output [31:0] PCOut
);
//******************************************************************/
//******************************************************************/

// assign  PortOut = 0;

//******************************************************************/
//******************************************************************/
// Data types to connect modules
wire Jump_wire;
wire BranchNE_wire;
wire BranchEQ_wire;
wire RegDst_wire;
wire MemRead_wire;
wire MemtoReg_wire;
wire MemWrite_wire;
wire NotZeroANDBrachNE;
wire ZeroANDBrachEQ;
wire ORForBranch;
wire ALUSrc_wire;
wire RegWrite_wire;
wire Zero_wire;
wire JR_wire;
wire [2:0] ALUOp_wire;
wire [3:0] ALUOperation_wire;
wire [4:0] WriteRegister_wire;
wire [4:0] MUX_RT_OR_RD_wire;
wire [31:0] MUX_PC_wire;
wire [31:0] PC_wire;
wire [31:0] Instruction_wire;
wire [31:0] ReadData1_wire;
wire [31:0] ReadData2_wire;
wire [31:0] InmmediateExtend_wire;
wire [31:0] ShitLeft2_SignExtend_wire;
wire [31:0] ReadData2OrInmmediate_wire;
wire [31:0] ALUResult_wire;
wire [31:0] PC_4_wire;
wire [31:0] InmmediateExtendAnded_wire;
wire [31:0] PCtoBranch_wire;
wire [31:0] MemoryOrAlu_wire;
wire [31:0] BranchAddress_wire;
wire [31:0] MUX_PC_4_OR_BEQ_wire;
wire [31:0] MUX_PC_4_OR_BEQ_OR_BNE_wire;
wire [7:0] Memory_wire;
wire [31:0] MUX_ALU_OR_MEMORY_OR_PC_4_wire;
wire [31:0] MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump_wire;
integer ALUStatus;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
ControlUnit
(
	.OP(Instruction_wire[31:26]),
	.RegDst(RegDst_wire),
	.BranchNE(BranchNE_wire),
	.BranchEQ(BranchEQ_wire),
	.MemRead(MemRead_wire),
	.MemtoReg(MemtoReg_wire),
	.MemWrite(MemWrite_wire),
	.ALUOp(ALUOp_wire),
	.ALUSrc(ALUSrc_wire),
	.RegWrite(RegWrite_wire),
	.Jump(Jump_wire)
);


PC_Register
ProgramCounter
(
	.clk(clk),
	.reset(reset),
	.NewPC(MUX_PC_wire),
	.PCValue(PC_wire)
);

assign PCOut = PC_wire;



ProgramMemory
#(
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
ROMProgramMemory
(
	.Address(PC_wire),
	.Instruction(Instruction_wire)
);

Adder32bits
PC_Plus_4
(
	.Data0(PC_wire),
	.Data1(4),
	
	.Result(PC_4_wire)
);


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Multiplexer2to1
#(
	.NBits(5)
)
MUX_ForRTypeAndIType
(
	.Selector(RegDst_wire),
	.MUX_Data0(Instruction_wire[20:16]),
	.MUX_Data1(Instruction_wire[15:11]),
	
	.MUX_Output(MUX_RT_OR_RD_wire)

);



RegisterFile
Register_File
(
	.clk(clk),
	.reset(reset),
	.RegWrite(RegWrite_wire),
	.WriteRegister(WriteRegister_wire),
	.ReadRegister1(Instruction_wire[25:21]),
	.ReadRegister2(Instruction_wire[20:16]),
	.WriteData(MUX_ALU_OR_MEMORY_OR_PC_4_wire),
	.ReadData1(ReadData1_wire),
	.ReadData2(ReadData2_wire)

);

SignExtend
SignExtendForConstants
(   
	.DataInput(Instruction_wire[15:0]),
   .SignExtendOutput(InmmediateExtend_wire)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_ForReadDataAndInmediate
(
	.Selector(ALUSrc_wire),
	.MUX_Data0(ReadData2_wire),
	.MUX_Data1(InmmediateExtend_wire),
	
	.MUX_Output(ReadData2OrInmmediate_wire)

);


ALUControl
ArithmeticLogicUnitControl
(
	.ALUOp(ALUOp_wire),
	.ALUFunction(Instruction_wire[5:0]),
	.ALUOperation(ALUOperation_wire),
	.jr(JR_wire)
);



ALU
Arithmetic_Logic_Unit 
(
	.ALUOperation(ALUOperation_wire),
	.A(ReadData1_wire),
	.B(ReadData2OrInmmediate_wire),
	.shamt(Instruction_wire[10:6]),
	.Zero(Zero_wire),
	.ALUResult(ALUResult_wire)
);

assign ALUResultOut = ALUResult_wire;

DataMemory
Memory
(
	.WriteData(ReadData2_wire[7:0]),
	.Address(ALUResult_wire[7:0]),
	.MemWrite(MemWrite_wire),
	.MemRead(MemRead_wire), 
	.clk(clk),
	.ReadData(Memory_wire)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_MemoryOrAlu
(
	.Selector(MemtoReg_wire),
	.MUX_Data0(ALUResult_wire),
	.MUX_Data1({24'b0, Memory_wire}),
	
	.MUX_Output(MemoryOrAlu_wire)

);


assign  PortOut = MemoryOrAlu_wire;

////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////


ShiftLeft2
ShitLeft2_SignExtend
(
	.DataInput(InmmediateExtend_wire),
	.DataOutput(ShitLeft2_SignExtend_wire)
);


Adder32bits
PC_4_Plus_ShitLeft2_SignExtend
(
	.Data0(PC_4_wire),
	.Data1(ShitLeft2_SignExtend_wire),
	
	.Result(BranchAddress_wire)
);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_PC_4_OR_BEQ
(
	.Selector(BranchEQ_wire & Zero_wire),
	.MUX_Data0(PC_4_wire),
	.MUX_Data1(BranchAddress_wire),
	
	.MUX_Output(MUX_PC_4_OR_BEQ_wire)

);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_PC_4_OR_BNE
(
	.Selector(BranchNE_wire & (!Zero_wire)),
	.MUX_Data0(MUX_PC_4_OR_BEQ_wire),
	.MUX_Data1(BranchAddress_wire),
	
	.MUX_Output(MUX_PC_4_OR_BEQ_OR_BNE_wire)

);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump
(
	.Selector(Jump_wire),
	.MUX_Data0(MUX_PC_4_OR_BEQ_OR_BNE_wire),
	.MUX_Data1({16'b0, Instruction_wire[13:0], 2'b00}), //PC_4_wire[31:28], Instruction_wire[25:0], 2'b00 ser+ía si tuvieramos muchas direcciones pero 
																		 // como el MIPS no tiene muchas entonces solo le pasamos los primeros 4 nibbles
	
	.MUX_Output(MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump_wire) //Es el wire que se conecta para indicar el nuevo PC
);


//Mux para guardar el PC en ra para jal
Multiplexer2to1
#(
	.NBits(5)
)
MUX_RT_OR_RD_OR_$ra
(
	.Selector(Jump_wire),
	.MUX_Data0(MUX_RT_OR_RD_wire),	//Pasa rt o rd
	.MUX_Data1(5'b11111), 				//Debe ser 31 exacto para que se escriba en $ra
	
	.MUX_Output(WriteRegister_wire) //Es el wire que se conecta para indicar el nuevo PC
);


//Mux para poner el valor del PC_4 en writeData
Multiplexer2to1
#(
	.NBits(32)
)
MUX_ALU_OR_MEMORY_OR_PC_4
(
	.Selector(Jump_wire),
	.MUX_Data0(MemoryOrAlu_wire),	
	.MUX_Data1(PC_4_wire), 				
	
	.MUX_Output(MUX_ALU_OR_MEMORY_OR_PC_4_wire) 
);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_ALU_OR_MEMORY_OR_PC_4_OR_JR
(
	.Selector(JR_wire),
	.MUX_Data0(MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump_wire),	
	.MUX_Data1(ReadData1_wire), 				
	
	.MUX_Output(MUX_PC_wire) 
);
endmodule

