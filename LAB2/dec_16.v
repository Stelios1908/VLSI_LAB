module dec_16 #(
   parameter widthi = 4
)(
    input clk,rst,enable,
    input [widthi-1:0] in,
    output [widtho-1:0] out
);
localparam widtho = 2**widthi;
wire [widtho-1:0] tempout;
wire [widtho-1:0] out;

dec_8 dec1(clk,rst,in[widthi-1],in[widthi-2:0],tempout[widtho/2-1:0]);
dec_8 dec2(clk,rst,!in[widthi-1],in[widthi-2:0],tempout[widtho-1:widtho/2]);

assign out = (!enable)? tempout : 0;
endmodule