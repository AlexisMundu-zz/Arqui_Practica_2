onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_Processor_TB/clk
add wave -noupdate /MIPS_Processor_TB/reset
add wave -noupdate /MIPS_Processor_TB/PortIn
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/ALUResultOut
add wave -noupdate -radix hexadecimal /MIPS_Processor_TB/PortOut
add wave -noupdate /MIPS_Processor_TB/PCOut
add wave -noupdate /MIPS_Processor_TB/DUV/Memory/Address
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ControlUnit/MemRead
add wave -noupdate /MIPS_Processor_TB/DUV/MUX_ALU_OR_MEMORY_OR_PC_4/MUX_Output
add wave -noupdate -divider -height 30 EX_MEM
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/PC_4
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/Zero_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/ALU_result_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/Data_2_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/Jump_address_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/Branch_adress_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/WriteRegister_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/PC_4_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/Jump_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/BranchEQ_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/BranchNE_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/MemRead_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/MemWrite_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/MemtoReg_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/RegWrite_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/JR_out
add wave -noupdate /MIPS_Processor_TB/DUV/Register_EX_MEM/RA_address_out
add wave -noupdate -divider -height 30 Memory
add wave -noupdate /MIPS_Processor_TB/DUV/Memory/WriteData
add wave -noupdate /MIPS_Processor_TB/DUV/Memory/Address
add wave -noupdate /MIPS_Processor_TB/DUV/Memory/MemWrite
add wave -noupdate /MIPS_Processor_TB/DUV/Memory/MemRead
add wave -noupdate /MIPS_Processor_TB/DUV/Memory/ReadData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 107
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {27 ps} {47 ps}
