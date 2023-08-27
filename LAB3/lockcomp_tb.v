module lockcomp_tb();

parameter  size = 16;
parameter factory_pass = 16'b0011001000010000;//1234
reg rstn,prs;
reg [size-1:0]incode;
integer error=-0;

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
    if(equal) error = error+1;
    #1;
    incode=16'b0011001000010000;
    #1;
    if(!equal) error= error+1;
    $display("incode : %d | factorycode : %d | equal : %d",incode,DUT.code_for_cmp,equal);
    #1;
    $display("CODE FROM COMPARE BEFORE CHANGE: %b",DUT.code_for_cmp);
    prs=1;
    incode=16'b0000000100100011;
    #1;
    if(DUT.code_for_cmp != 16'b0000000100100011) error = error+1;
    $display("CODE FROM COMPARE NOW IS : %b",DUT.code_for_cmp);

    if(error)
     $display("NO SUCESS ERROR !!!!");
    else 
     $display("SUCCESS  NO ERROR!!!!!");

end

endmodule