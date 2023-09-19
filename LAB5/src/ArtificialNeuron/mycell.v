module mycell #(
    parameter m=8,  //input activation
    parameter n=8,  //length weigth
    parameter k=8  //length activation
)(
    input  [k-1:0] activation,
    input  [n-1:0] weigth,
    input  [k+n+$clog2(m)-1:0]sum_in,
    output  [k+n+$clog2(m)-1:0] sum_out
);

assign sum_out = activation*weigth + sum_in;

endmodule