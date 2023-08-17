module VendingMachine_tb();

integer period=4;
integer cnt_coffee=0;
reg clk,rst,c5,c10,NFC,beans;
reg [4:0] water;
wire error,coffee;

integer i;
integer trials=7;

VendingMachine DUT(
                    .clk(clk),
                    .rst(rst),
                    .c5(c5),
                    .c10(c10),
                    .NFC(NFC),
                    .beans(beans),
                    .water(water),
                    .coffee(coffee),
                    .error(error)

) ; 

 always #(period*0.5) clk=~clk; 

 always @(*)begin if(coffee) water = water-1; cnt_coffee=cnt_coffee+1; end
 always @(*)begin if(cnt_coffee==0) beans=0; end
 always @(posedge clk) begin
        #(period*0.30)
        c5=0;
        c10=0;
        NFC=0;
          
  end


 initial begin 

 $monitor("state = %b | coffee  = %b | ERROR = %b | c5 = %b | c10 =%b | NFC = %b | water  = %d | beans  = %d",DUT.state,coffee,error,c5,c10,NFC,water,beans);
    clk =0;
    rst=0;
    c5=0;
    c10=0;
    NFC=0;
    water=12;
    //beans=1;
    #(period*0.3);
    beans=1;// an to valo edo tha exo thema me to nextstate
    rst=1;
    #(period*0.7);
    
   
    for(i=0; i<trials; i=i+1) begin 
        //pame gia  kafe me dio c5
        $display("===============================================================================");
        $display("===================== C5 AND C5 ===============================================");
        c5=1;
        #(period*2);
        c5=1;
        #(period);
        #(period*6);
    
        //pame gia  kafe me ena c10
        $display("===============================================================================");
        $display("=====================     C10    ==============================================");
        c10=1;
        #(period);
        #(period*6);
        //pame gia  kafe me ena NFC
        $display("===============================================================================");
        $display("=====================   N F C   ===============================================");
        NFC=1;
        #(period);
        #(period*6);
        //pame gia  kafe me c5 kai meta  ena NFC
        $display("===============================================================================");
        $display("===================== C5 AND NFC ==============================================");
        c5=1;
        #(period);
        #(period*3);
        NFC=1;
        #(period);
        #(period*6);
         //pame gia  kafe me c5 kai meta c10
        $display("===============================================================================");
        $display("===================== C5 AND C10 ==============================================");
        c5=1;
        #(period);
        #(period*3);
        c10=1;
        #(period);
        #(period*6);

        if(i==3) begin  water=20; end
        if(i==4) begin beans=0;   end
        else     begin beans=1;   end
    end  //end for
$finish;
    
end

 initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0);
    
 end
endmodule
