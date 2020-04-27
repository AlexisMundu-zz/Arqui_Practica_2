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
add wave -noupdate -divider {Forwarding Unit}
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/EX_MEM_RegWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/MEM_WB_RegWrite
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/Rs
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/Rt
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/EX_MEM_Rd
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/MEM_WB_Rd
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/ForwardA
add wave -noupdate /MIPS_Processor_TB/DUV/ForwardingUnit/ForwardB
add wave -noupdate -divider ALU
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/A
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/B
add wave -noupdate /MIPS_Processor_TB/DUV/Arithmetic_Logic_Unit/ALUResult
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ps} 0}
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
WaveRestoreZoom {0 ps} {28 ps}
