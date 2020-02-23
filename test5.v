module leftshift(s,clk,q);
    input s,clk;
    output reg [3:0] q;
    
    always @(posedge clk,s)
        begin
            if(s)
                q[0]=1'b1;
            else if(clk)
                q=q<<1;
        end
endmodule

module stimulus;
    reg s,clk;
    wire [3:0] q;
    

    leftshift ls(s,clk,q);

    initial
        begin
          clk=1'b0;
          forever begin #10 clk=~clk;
            end
        end
    
    initial 
    begin
        $dumpfile("ls.vcd");
        $dumpvars(1,stimulus);
        #10 s=1'b1; 
        #25 s=1'b0;
        #200 
        $finish;
    end
    initial
        $monitor($time,"s=%d q=%4b",s,q);
endmodule