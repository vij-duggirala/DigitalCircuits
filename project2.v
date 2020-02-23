module sqd( input_x, clock, output_z, reset);
    input input_x;
    input clock;
    input reset;
    output reg [1:0] output_z;


parameter   S0=2'b00,
            S1=2'b01,
            S2=2'b10;
            //S3=2'b11;
reg [1:0] current_state, next_state;

always @(posedge clock, posedge reset)
begin 
    if(reset)
        current_state <= S0; 
    else    
        current_state <= next_state;
end

always @(current_state, input_x)
begin 
    case(current_state)
    S0:begin    
        if(input_x)
            next_state<=S1;
        else    
            next_state<=S0;
        end
    S1:begin   
        if(input_x)
            next_state<=S0;
        else    
            next_state<=S2;
        end
    S2:begin
        if(input_x)
            next_state<=S2;
        else    
            next_state<=S1;
        end
    /*S3:begin
        if(input_x)
            next_state<=S3;
        else    
            next_state<=S2;
        end*/
    //default: next_state<=S0;
    endcase
end

always @(next_state)
begin
    output_z = next_state;
end

endmodule


 module stimulus;
reg clock;
reg reset;
//integer k;
//reg [5:0] data;
reg input_x;
wire reg [1:0] output_z;

sqd name(input_x, clock, output_z, reset);

initial
    begin
    clock=1'b0;
forever begin
    #5; clock=~clock;
    end
end

 initial begin

  $dumpfile("project2.vcd");
  $dumpvars(0, stimulus);
  
  input_x = 0;
  reset = 1;
  #30;
      reset = 0;
  #5;
  input_x = 1;
  #10;
  input_x = 0;
  #10;
  input_x = 1;
  #10;
  //input_x = 1;
  //#10;
  //input_x = 1;
  //#10;
  input_x = 0;
  #5;
  
  
  $finish;

 end

initial
    $monitor("input = %d output= %d ", input_x, output_z);

endmodule 
