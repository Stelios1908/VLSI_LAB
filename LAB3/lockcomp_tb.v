module lockcomp_tb();

parameter  size = 16;
parameter factory_pass = 16'b0011001000010000;//1234
reg rstn,prs;
reg [size-1:0]incode;

lockcomp #(size,factory_pass)  DUT (
                    .prs(prs),
                    .rstn(rstn),
                    .incode(incode),
                    .equal(equal)
);


initial begin
    rstn=0;
    prs=0;
    #2;
    rstn=1;
    #2;
    incode=16'b0011001000010001;
    #1;
    $display("incode : %d | factorycode : %d | equal : %d",incode,DUT.factory_pass,equal);
    #1;
    incode=16'b0011001000010000;
    #1;
    $display("incode : %d | factorycode : %d | equal : %d",incode,DUT.code_for_cmp,equal);
end

endmodule