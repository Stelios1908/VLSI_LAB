module shift_reg_tb;

parameter width = 8;
localparam period=10;

reg clk,rst,pl,enable,si;
reg [width-1:0]pi;
integer i;

shift_reg #(width) DUT(
         .clk(clk),
         .rst(rst),
         .pl(pl),
         .pi(pi),
         .enable(enable),
         .si(si),
         .so(so)
);
always  begin
    #(period*0.5)
    clk=~clk;
end

initial begin
        clk = 0;
        enable = 0;
        pl = 0;
        si = 1;
        #1
        rst = 0;
        #1
        rst = 1;
        #1
         $display("==========================================");
         $display("NOW CHECK SHIFT AFTER RESET");
         $display("==========================================");
           for(i=0;i<width;i=i+1) begin       
                if(so==0) begin
                   $display("SUCCESS | CLK =%0d |SERIAL OUT = %0b",i+1,so);
                end
                else begin
                   $display("NO SUCCESS | CLK =%0d |SERIAL OUT = %0b ",i+1,so);
                end  
            #(period) ;        
        end
        pi = 8'ha5;
        pl=1;
        #(period)
        pl=0;
        enable=1;
        #2
        $display("==========================================");
        $display("NOW CHECK  SHIFT AFTER LOAD 0xaa");
        $display("==========================================");
        for(i=0;i<width;i=i+1) begin
            if(pi[i]==so) begin
                   $display("SUCCESS | CLK =%0d |SERIAL OUT = %0b | EXPECTED VALUE = %0b",i+1,so,pi[i]);
                end
                else begin
                   $display("NO SUCCESS | CLK =%0d |SERIAL OUT = %0b | EXPECTED VALUE = %0b|",i+1,so,pi[i]);
                end  
            #(period) ;        
        end
         if(so==si) 
          $display("SUCCESS |SERIAL IN = %0b AFTER 8 CLK IS AT SERIAL OUT = %0b",si,so);
        else
          $display("NO SUCCESS |SERIAL IN = %0b AFTER 8 CLK IS AT SERIAL OUT = %0b",si,so);
       $finish;
end

initial  begin 
    $dumpfile("dump.vcd");
    $dumpvars(0);
end


endmodule