
module adder(x, y, sum, carry);
    input  x;
    input  y;
    output  sum;
    output carry;

  assign sum= x^y;
  assign carry = ~(x|y);


endmodule

module stimulus;
    reg x;
    reg y;
    wire sum;
    wire carry;
    
    adder a(x, y, sum ,carry);
    initial 
        begin
            
          x=1'b0;y=1'b0;
          #20; x=1'b0;y=1'b1;
          #20; x=1'b1; y=1'b0;
          #20; x=1'b1;y=1'b1;
        end
    initial
        $monitor("x: %d  y: %d  sum: %d  carry: %d", x, y, sum, carry);
endmodule