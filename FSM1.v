module FSM1(a, clk, reset, out);
  input a, clk, reset;
  output reg out;
  reg [1:0] state, ntst;
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

  always @(posedge clk, posedge reset) begin
    if (reset == 1)
      state <= S0;
    else
      state <= ntst;
  end

  always @(state, a) begin
    case (state)
      S0:
        if (a) begin
          ntst = S1;
          out = 0;
        end
        else begin
          ntst = S0;
          out = 0;
        end

      S1:
        if (a) begin
          ntst = S1;
          out = 0;
        end
        else begin
          ntst = S2;
          out = 0;
        end

      S2:
        if (a) begin
          ntst = S1;
          out = 1;
        end
        else begin
          ntst = S0;
          out = 0;
        end
    endcase
  end
endmodule

module tb;
reg a,clk,reset;
wire out;
FSM1 f1(.a(a),.clk(clk),.reset(reset),.out(out));
initial begin
clk=0;
forever #5 clk=~clk;
end

initial fork
reset=1;
a=0;
#2 reset=0;
#10 a=0;
#20 a=1;
#30 a=1;
#40 a=0;
#50 a=1;
#60 a=1;
#70 a=0;
#80 a=1;
#90 a=0;
#100 a=1;
#120 a=0;
#130 a=0;
#150 $finish;
join
endmodule
