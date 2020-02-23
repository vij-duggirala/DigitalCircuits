module T_FF(q, clk, reset);
    output q;
    input clk, reset;
    wire d;
    D_FF dff0(q, d, clk, reset);
    not n1(d, q); 
endmodule

module D_FF(q, d, clk, reset);
    output q;
    input d, clk, reset;
    reg q;
    always @(posedge reset or negedge clk)
    if (reset)
        q <= 1'b0;
    else
        q <= d;
endmodule
