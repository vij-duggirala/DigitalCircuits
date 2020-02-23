module comparator(a,b,eq,lt,gt);
input [3:0] a,b;
output reg eq,lt,gt;

wire [3:0] x;

assign x[0] = a[0]&b[0] | (~a[0])&(~b[0]);
assign x[1] = a[1]&b[1] | (~a[1])&(~b[1]);
assign x[2] = a[2]&b[2] | (~a[2])&(~b[2]);
assign x[3] = a[3]&b[3] | (~a[3])&(~b[3]);

wire f1,f2;

assign f1 = (x[0]&x[1])&(x[2]&x[3]);
assign f2 = (a[3]&(~b[3])) | (a[2]&(~b[2])&x[3]) | (a[1]&(~b[1])&x[2]&x[3]) | (a[0]&(~b[0])&x[2]&x[3]&x[1]);

always @(eq, lt, gt)
begin
    if(f1)
    begin 
    eq = 1'b1;
    lt = 1'b0;
    gt = 1'b0;
    end
    else if(f2)
    begin 
    eq = 1'b0;
    lt = 1'b0;
    gt = 1'b1;
    end
    else 
    begin 
    eq = 1'b0;
    lt = 1'b1;
    gt = 1'b0;
    end
end
endmodule


module comparator_tst;
    reg [3:0]a,b;
    wire eq,lt,gt;
    comparator DUT (a,b,eq,lt,gt);
    
    initial 
    begin   
        $dumpfile("harshit.vcd");
        $dumpvars(0, comparator_tst);
        a=4'b1100;
        b=4'b1100;
        #10;

        a=4'b0100;
        b=4'b1100;
        #10;

        a=4'b0101;
        b=4'b1010;
        #10;

        a=4'b1111;
        b=4'b1000;
        #10;

        a=4'b1100;
        b=4'b1100;
        #10;

        a=4'b0000;
        b=4'b1100;
        #10;
        $stop;
    end
    initial
        $display("%d", a);
    
endmodule