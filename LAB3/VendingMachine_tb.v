module VendingMachine_tb();

integer period=4;
integer cnt_coffee=0;
reg clk,rst,c5,c10,NFC,beans;
reg [4:0] water;
wire error,coffee;

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
 initial begin 

 $monitor("state = %b |nextstate = %b|  coffee  = %b | ERROR = %b | c5 = %b | c10 =%b | NFC = %b | message = %b",DUT.state,DUT.nextstate,coffee,error,c5,c10,NFC,DUT.message);
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
    
   

    //pame gia  kafe me dio c5
    c5=1;
    #(period);
    c5=0;
    #(period*2);
    c5=1;
    #(period);
    #(period*6);
    //pame gia  kafe me ena c10
    c10=1;
    #(period);
    c10=0;
    #(period*6);
    //pame gia  kafe me ena NFC
    NFC=1;
    #(period);
    NFC=0;
    #(period*6);
    //pame gia  kafe me c5 kai meta  ena NFC
    c5=1;
    #(period);
    c5=0;
    #(period*3);
    NFC=1;
    #(period);
    NFC=0;
    #(period*6);
     //pame gia  kafe me c5 kai meta c10
    c5=1;
    #(period);
    c5=0;
    #(period*3);
    c10=1;
    #(period);
    c10=0;
    #(period*6);
    $finish;
 end

 initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0);
    
 end
endmodule