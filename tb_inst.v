module tb
();

reg [63:0] Inst_Addresstb;

wire [31:0] Instructiontb;

Instruction_Memory im

(
.Inst_Address(Inst_Addresstb),
.Instruction(Instructiontb)
);

initial
begin
Inst_Addresstb = 64'd5;
  
end

endmodule