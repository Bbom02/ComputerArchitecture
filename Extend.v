module Extend(
	ExtImm,
	Instr, ImmSrc
	);
 
 input [23:0] Instr;
 input [1:0] ImmSrc;
 output reg [31:0] ExtImm;
 
	always @(*) begin
		case(ImmSrc)
			2'b01: //data processing type
				begin
					ExtImm = {{8{1'b0}}, Instr[23:0]};
				end
			2'b10: //LDR/STR type
				begin
					ExtImm = {{20{1'b0}} ,Instr[11:0]};
				end
			2'b11: //branch type
				begin
					ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00};
				end
			default:
				ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00};
		endcase
	end
endmodule