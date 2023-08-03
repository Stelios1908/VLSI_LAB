module dec_8 #(
    parameter widthi=3
    
)(
    input clk,rst,enable,
    input [widthi-1:0]in,
    output [widtho-1:0]regout
);
localparam widtho=2**widthi;
reg [widtho-1:0] out;
reg [widtho-1:0] regout;


always @(*)  begin
    out=0;
    if(!enable) begin
     out[in]=1'b1;
    end
end

always @(posedge clk)  begin
    if(!rst) regout <= 0;
    else  regout <= out;   
end


endmodule