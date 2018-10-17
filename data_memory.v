module Data_Memory
(

  input [63:0] Mem_Addr,
  input [63:0] Write_Data,
  input clk,
  input MemWrite,
  input MemRead,
  input [1:0] OP,
  
  output reg [63:0] Read_Data
  );

reg [7:0] memory [63:0];

//For Writing
always @ (posedge clk)
begin
  
if (MemWrite == 1 and OP == 2b'00)
  memory[Mem_Addr] = Write_Data[7:0];
else if (MemWrite == 1 and OP == 2b'01)
  begin
    memory[Mem_Addr] = Write_Data[7:0];
    memory[Mem_Addr+1] = Write_Data[15:8];
  end
else if (MemWrite == 1 and OP == 2b'10)
  begin
    memory[Mem_Addr] = Write_Data[7:0];
    memory[Mem_Addr+1] = Write_Data[15:8];
    memory[Mem_Addr+2] = Write_Data[23:16];
    memory[Mem_Addr+3] = Write_Data[31:24];
  end
else if (MemWrite == 1 and OP == 2b'11)
  begin
    memory[Mem_Addr] = Write_Data[7:0];
    memory[Mem_Addr+1] = Write_Data[15:8];
    memory[Mem_Addr+2] = Write_Data[23:16];
    memory[Mem_Addr+3] = Write_Data[31:24];    
    memory[Mem_Addr+4] = Write_Data[39:32];
    memory[Mem_Addr+5] = Write_Data[47:40];
    memory[Mem_Addr+6] = Write_Data[55:48];
    memory[Mem_Addr+7] = Write_Data[63:56];
  end
end

//To read

always
begin
  
if (MemRead == 1 and OP == 2b'00)
  Read_Data =  memory[Mem_Addr];
 
elseif (MemRead == 1 and OP == 2b'01)
 Read_Data =  {memory[Mem_Addr+1],memory[Mem_Addr]};

elseif (MemRead == 1 and OP == 2b'10)
 Read_Data =  {memory[Mem_Addr+3],memory[Mem_Addr+2],memory[Mem_Addr+1],memory[Mem_Addr]}; 

elseif (MemRead == 1 and OP == 2b'11)
 Read_Data =  {memory[Mem_Addr+7],memory[Mem_Addr+6],memory[Mem_Addr+5],memory[Mem_Addr+4],memory[Mem_Addr+3],memory[Mem_Addr+2],memory[Mem_Addr+1],memory[Mem_Addr]}; 
 
 end
 
 endmodule  