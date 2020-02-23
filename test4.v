module sync( clk, reset, q);
    input clk, reset;
    output reg [3:0] q;
    always @(posedge clk)
        begin
            if(reset)
                q=4'b0000;
            else    
                q<=q+4'd1;
        end
    
endmodule

module stimulus;
    reg clk, reset;
    wire [3:0] q;

    
    sync s(clk , reset, q);

    initial     
        begin
          clk=1'b0;
          forever
            begin #10 clk=~clk;
            end
        end

    initial 
        begin   
            $dumpfile("test4.vcd");
            $dumpvars(1, stimulus);
            reset=1'b1;
            #20 reset=1'b0;
            #200
            $finish;
        end
    initial 
        $monitor($time, "%d", q);

endmodule