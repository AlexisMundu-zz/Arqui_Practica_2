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
wire Jump_register_ID_EX_in_wire;
wire Jump_register_EX_MEM_in_wire;

wire BranchNE_wire;
wire BranchNE_register_ID_EX_in_wire;
wire BranchNE_register_EX_MEM_in_wire;

wire BranchEQ_wire;
wire BranchEQ_register_ID_EX_in_wire;
wire BranchEQ_register_EX_MEM_in_wire;

wire RegDst_wire;
wire RegDst_register_EX_MEM_in_wire;

wire MemRead_wire;
wire MemRead_register_ID_EX_in_wire;
wire MemRead_register_EX_MEM_in_wire;

wire MemWrite_wire;
wire MemWrite_register_ID_EX_in_wire;
wire MemWrite_register_EX_MEM_in_wire;

wire MemtoReg_wire;
wire MemtoReg_register_ID_EX_in_wire;
wire MemtoReg_register_EX_MEM_in_wire;
wire MemtoReg_register_MEM_WB_in_wire;

wire ALUSrc_wire;
wire ALUSrc_register_ID_EX_in_wire;

wire RegWrite_wire;
wire RegWrite_register_ID_EX_in_wire;
wire RegWrite_register_EX_MEM_in_wire;
wire RegWrite_register_MEM_WB_in_wire;
//
wire Zero_wire;
wire Zero_register_EX_MEM_in_wire;

wire JR_wire;
wire JR_register_EX_MEM_in_wire;

wire [2:0] ALUOp_wire;
wire [2:0] ALUOp_register_ID_EX_in_wire;

wire [3:0] ALUOperation_wire;

wire [4:0] WriteRegister_wire;
wire [4:0] WriteRegister_register_EX_MEM_in_wire;
wire [4:0] WriteRegister_register_MEM_WB_in_wire;

wire [4:0] MUX_RT_OR_RD_wire;

wire [31:0] MUX_PC_wire;
wire [31:0] PC_wire;

//
wire [31:0] Instruction_wire;
wire [31:0] Instruction_register_ID_EX_out_wire;

wire [31:0] Instruction_register_in_wire;

//
wire [31:0] ReadData1_wire;
wire [31:0] ReadData1_register_ID_EX_in_wire;
//
wire [31:0] ReadData2_wire;
wire [31:0] ReadData2_register_ID_EX_in_wire;
wire [31:0] ReadData2_register_EX_MEM_out_wire;
//
wire [31:0] InmmediateExtend_wire;
wire [31:0] InmmediateExtend_register_ID_EX_in_wire;

wire [31:0] ShitLeft2_SignExtend_wire;
wire [31:0] ReadData2OrInmmediate_wire;

wire [31:0] ALUResult_wire;
wire [31:0] ALUResult_register_EX_MEM_in_wire;
wire [31:0] ALUResult_register_MEM_WB_in_wire;

wire [31:0] PC_4_wire;
wire [31:0] PC_4_register_IF_ID_in_wire;
wire [31:0] PC_4_register_ID_EX_in_wire;
wire [31:0] PC_4_register_EX_MEM_in_wire;
wire [31:0] PC_4_register_MEM_WB_in_wire;
wire [31:0] PC_4_register_MEM_WB_out_wire;

wire [31:0] InmmediateExtendAnded_wire;
wire [31:0] PCtoBranch_wire;
wire [31:0] MemoryOrAlu_wire;
//
wire [31:0] BranchAddress_wire;
wire [31:0] BranchAddress_register_EX_MEM_in_wire;

wire [31:0] MUX_PC_4_OR_BEQ_OR_BNE_wire;

wire [31:0] Memory_wire;
wire [31:0] Memory_register_MEM_WB_in_wire;

wire [31:0] MUX_ALU_OR_MEMORY_OR_PC_4_wire;
wire [31:0] MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump_wire;

wire [31:0] Jump_address_wire;
wire [31:0] Jump_address_register_EX_MEM_in_wire;

wire [31:0] RA_address_wire;

wire [1:0] ForwardA_wire;
wire [1:0] ForwardB_wire;

wire [31:0] MUX_Data1_or_MemoryOrAlu_wire;

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
	.RegDst(RegDst_register_ID_EX_in_wire),
	.BranchNE(BranchNE_register_ID_EX_in_wire),
	.BranchEQ(BranchEQ_register_ID_EX_in_wire),
	.MemRead(MemRead_register_ID_EX_in_wire),
	.MemtoReg(MemtoReg_register_ID_EX_in_wire),
	.MemWrite(MemWrite_register_ID_EX_in_wire),
	.ALUOp(ALUOp_register_ID_EX_in_wire),
	.ALUSrc(ALUSrc_register_ID_EX_in_wire),
	.RegWrite(RegWrite_register_ID_EX_in_wire),
	.Jump(Jump_register_ID_EX_in_wire)
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
	.Instruction(Instruction_register_in_wire)
);

Adder32bits
PC_Plus_4
(
	.Data0(PC_wire),
	.Data1(4),
	
	.Result(PC_4_wire)
);

assign PC_4_register_IF_ID_in_wire = PC_4_wire;


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
	.MUX_Data0(Instruction_register_ID_EX_out_wire[20:16]),
	.MUX_Data1(Instruction_register_ID_EX_out_wire[15:11]),
	
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
	.ReadData1(ReadData1_register_ID_EX_in_wire),
	.ReadData2(ReadData2_register_ID_EX_in_wire)

);

SignExtend
SignExtendForConstants
(   
	.DataInput(Instruction_wire[15:0]),
   .SignExtendOutput(InmmediateExtend_register_ID_EX_in_wire)
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
	.ALUFunction(Instruction_register_ID_EX_out_wire[5:0]),
	.ALUOperation(ALUOperation_wire),
	.jr(JR_register_EX_MEM_in_wire)
);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_ReadData1_or_MemoryOrAlu
(
	.Selector(ForwardA_wire[0]),
	.MUX_Data0(ReadData1_wire),
	.MUX_Data1(MemoryOrAlu_wire),
	
	.MUX_Output(MUX_Data1_or_MemoryOrAlu_wire)

);


ALU
Arithmetic_Logic_Unit 
(
	.ALUOperation(ALUOperation_wire),
	.A(ReadData1_wire),
	.B(ReadData2OrInmmediate_wire),
	.shamt(Instruction_register_ID_EX_out_wire[10:6]),
	.Zero(Zero_register_EX_MEM_wire),
	.ALUResult(ALUResult_register_EX_MEM_in_wire)
);

assign ALUResultOut = ALUResult_wire;

DataMemory
#(
	.DATA_WIDTH(32),
	.MEMORY_DEPTH(MEMORY_DEPTH)
)
Memory
(
	.WriteData(ReadData2_register_EX_MEM_out_wire),
	.Address((ALUResult_register_MEM_WB_in_wire - 32'h10010000) >> 2 ), //Se debe restar 10010000 para que inicie en la dirección 0 ya que no tenemos MEMORY_DEPTH suficiente para 32 bits
	.MemWrite(MemWrite_wire),
	.MemRead(MemRead_wire), 
	.clk(clk),
	.ReadData(Memory_register_MEM_WB_in_wire)
);



Multiplexer2to1
#(
	.NBits(32)
)
MUX_MemoryOrAlu
(
	.Selector(MemtoReg_wire),
	.MUX_Data0(ALUResult_wire),
	.MUX_Data1(Memory_wire),
	
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
	.Data0(PC_4_register_EX_MEM_in_wire),
	.Data1(ShitLeft2_SignExtend_wire),
	
	.Result(BranchAddress_register_EX_MEM_in_wire)
);


Multiplexer2to1
#(
	.NBits(32)
)
MUX_PC_4_OR_BEQ_OR_BNE
(
	.Selector((BranchEQ_wire & Zero_wire) | (BranchNE_wire & (!Zero_wire))),
	.MUX_Data0(PC_4_wire),
	.MUX_Data1(BranchAddress_wire),
	
	.MUX_Output(MUX_PC_4_OR_BEQ_OR_BNE_wire)

);

assign Jump_address_register_EX_MEM_in_wire = {16'b0, Instruction_register_ID_EX_out_wire[13:0], 2'b00};

Multiplexer2to1
#(
	.NBits(32)
)
MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump
(
	.Selector(Jump_wire),
	.MUX_Data0(MUX_PC_4_OR_BEQ_OR_BNE_wire),
	.MUX_Data1(Jump_address_wire), //PC_4_wire[31:28], Instruction_wire[25:0], 2'b00 ser+ía si tuvieramos muchas direcciones pero 
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
	
	.MUX_Output(WriteRegister_register_EX_MEM_in_wire) //Es el wire que se conecta para indicar el nuevo PC
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
	.MUX_Data1(PC_4_register_MEM_WB_out_wire), 				
	
	.MUX_Output(MUX_ALU_OR_MEMORY_OR_PC_4_wire) 
);

Multiplexer2to1
#(
	.NBits(32)
)
MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump_OR_JR_wire
(
	.Selector(JR_wire),
	.MUX_Data0(MUX_PC_4_OR_BEQ_OR_BNE_OR_Jump_wire),	
	.MUX_Data1(RA_address_wire), 				
	
	.MUX_Output(MUX_PC_wire) 
);


Register_IF_ID
Register_IF_ID
(
	.clk(clk),
	.reset(reset),
	.PC_4(PC_4_register_IF_ID_in_wire),
	.Instruction(Instruction_register_in_wire),
	.PC_4_out(PC_4_register_ID_EX_in_wire),
	.Instruction_out(Instruction_wire)
);

/////////////////////////////////////////////////
//////////// REGISTERS FOR PIPELINE /////////////
/////////////////////////////////////////////////

Register_ID_EX
Register_ID_EX
(
	.clk(clk),
	.reset(reset),
	.PC_4(PC_4_register_ID_EX_in_wire),
	.Data_1(ReadData1_register_ID_EX_in_wire),
	.Data_2(ReadData2_register_ID_EX_in_wire),
	.Sign_extended(InmmediateExtend_register_ID_EX_in_wire),
	//Control
	.Jump(Jump_register_ID_EX_in_wire),
	.RegDst(RegDst_register_ID_EX_in_wire),
	.BranchEQ(BranchEQ_register_ID_EX_in_wire),
	.BranchNE(BranchNE_register_ID_EX_in_wire),
	.MemRead(MemRead_register_ID_EX_in_wire),
	.MemtoReg(MemtoReg_register_ID_EX_in_wire),
	.MemWrite(MemWrite_register_ID_EX_in_wire),
	.ALUSrc(ALUSrc_register_ID_EX_in_wire),
	.RegWrite(RegWrite_register_ID_EX_in_wire),
	.ALUOp(ALUOp_register_ID_EX_in_wire),
	.Instruction(Instruction_wire),

	.PC_4_out(PC_4_register_EX_MEM_in_wire),
	.Data_1_out(ReadData1_wire),
	.Data_2_out(ReadData2_wire),
	.Sign_extended_out(InmmediateExtend_wire),
	//Control
	.Jump_out(Jump_register_EX_MEM_in_wire),
	.RegDst_out(RegDst_wire),
	.BranchEQ_out(BranchEQ_register_EX_MEM_in_wire),
	.BranchNE_out(BranchNE_register_EX_MEM_in_wire),
	.MemRead_out(MemRead_register_EX_MEM_in_wire),
	.MemtoReg_out(MemtoReg_register_EX_MEM_in_wire),
	.MemWrite_out(MemWrite_register_EX_MEM_in_wire),
	.ALUSrc_out(ALUSrc_wire),
	.RegWrite_out(RegWrite_register_EX_MEM_in_wire),
	.ALUOp_out(ALUOp_wire),
	.Instruction_out(Instruction_register_ID_EX_out_wire)
);


Register_EX_MEM
Register_EX_MEM
(
	.clk(clk),
	.reset(reset),
	.Zero(Zero_register_EX_MEM_wire),
	.ALU_result(ALUResult_register_EX_MEM_in_wire),
	.Data_2(ReadData2_wire),
	.Jump_address(Jump_address_register_EX_MEM_in_wire),
	.Branch_adress(BranchAddress_register_EX_MEM_in_wire),
	.WriteRegister(WriteRegister_register_EX_MEM_in_wire),
	.PC_4(PC_4_register_EX_MEM_in_wire), 
	//Control
	.Jump(Jump_register_EX_MEM_in_wire),
	.BranchEQ(BranchEQ_register_EX_MEM_in_wire),
	.BranchNE(BranchNE_register_EX_MEM_in_wire),
	.MemRead(MemRead_register_EX_MEM_in_wire),
	.MemWrite(MemWrite_register_EX_MEM_in_wire),
	.MemtoReg(MemtoReg_register_EX_MEM_in_wire),
	.RegWrite(RegWrite_register_EX_MEM_in_wire),
	
	.JR(JR_register_EX_MEM_in_wire),
	.RA_address(ReadData1_wire),	
	
	.Zero_out(Zero_wire),
	.ALU_result_out(ALUResult_register_MEM_WB_in_wire),
	.Data_2_out(ReadData2_register_EX_MEM_out_wire),
	.Jump_address_out(Jump_address_wire),
	.Branch_adress_out(BranchAddress_wire),
	.WriteRegister_out(WriteRegister_register_MEM_WB_in_wire),
	.PC_4_out(PC_4_register_MEM_WB_in_wire), 	
	//Control
	.Jump_out(Jump_wire),
	.BranchEQ_out(BranchEQ_wire),
	.BranchNE_out(BranchNE_wire),
	.MemRead_out(MemRead_wire),
	.MemWrite_out(MemWrite_wire),
	.MemtoReg_out(MemtoReg_register_MEM_WB_in_wire),
	.RegWrite_out(RegWrite_register_MEM_WB_in_wire),
	
	.JR_out(JR_wire),
	.RA_address_out(RA_address_wire)
);


Register_MEM_WB
Register_MEM_WB
(
	.clk(clk),
	.reset(reset),
	.ALU_result(ALUResult_register_MEM_WB_in_wire),
	.Read_data(Memory_register_MEM_WB_in_wire),
	.WriteRegister(WriteRegister_register_MEM_WB_in_wire),
	.PC_4(PC_4_register_MEM_WB_in_wire),
	//Control
	.MemtoReg(MemtoReg_register_MEM_WB_in_wire),
	.RegWrite(RegWrite_register_MEM_WB_in_wire),
	
	
	.ALU_result_out(ALUResult_wire),
	.Read_data_out(Memory_wire),
	.WriteRegister_out(WriteRegister_wire),
	.PC_4_out(PC_4_register_MEM_WB_out_wire), 	
	//Control
	.MemtoReg_out(MemtoReg_wire),
	.RegWrite_out(RegWrite_wire)
);

/////////////////////////////////////////////////
///////////// FORWARDING UNIT ///////////////////
/////////////////////////////////////////////////
ForwardingUnit
ForwardingUnit
(

	.reset(reset),
	.EX_MEM_RegWrite(RegWrite_register_EX_MEM_in_wire),
	.MEM_WB_RegWrite(RegWrite_register_MEM_WB_in_wire),
	.Rs(Instruction_register_ID_EX_out_wire[25:21]),
	.Rt(Instruction_register_ID_EX_out_wire[20:16]),
	.EX_MEM_Rd(WriteRegister_register_MEM_WB_in_wire),
	.MEM_WB_Rd(WriteRegister_wire),
	.ForwardA(ForwardA_wire),
	.ForwardB(ForwardB_wire)
);

endmodule

