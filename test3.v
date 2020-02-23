module encoder(a, b, c, d, s1, s0);
    input a, b, c, d;
    output reg s1, s0;
    always @(a or b or c or d)
        begin
          s1=b|a;
          s0=a|c;
        end

endmodule


module stimulus;
    reg a, b, c, d;
    wire s1, s0;

    encoder en(a, b, c, d, s1, s0);

    initial 
        begin
            $dumpfile("test3.vcd");
            $dumpvars(1, stimulus);
          #10 a=1'b0; b=1'b0; c=1'b0; d=1'b1;
          #10 a=1'b0; b=1'b0; c=1'b1; d=1'b0;
          #10 a=1'b0; b=1'b1; c=1'b0; d=1'b0;
          #10 a=1'b1; b=1'b0; c=1'b0; d=1'b0;
          #10
          $finish;
        end

    initial 
        $monitor("%d%d%d%d    %d%d", a, b, c, d, s1, s0);
endmodule