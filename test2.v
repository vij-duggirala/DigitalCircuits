module dflipflop(q, d,clk,reset);
    input clk, reset, d;
    output reg q;
    always @(posedge clk, d)
    begin
        if(reset)
            q=1'b0;
        else
            q<=d;
    end
endmodule

module stimulus;
    reg clk, reset ,d;
    wire q;
    dflipflop dff(q, d, clk , reset);
    initial
        begin       
            clk=0;
            forever begin #10; clk=~clk;end
        end
    initial
        begin   
        $dumpfile("test2.vcd");
  $dumpvars(0, stimulus);
            reset=1;
        d<=0;
        #200;
        reset=0;
        d<=1;
        #20;
        d<=0;
        #20;
        d<=1;
        #20;
        $finish;
    end
    initial
        $monitor($time,"reset: %d D: %d Q: %d", reset, d, q);
endmodule

