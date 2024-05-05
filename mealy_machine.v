module mealy_machine(a, clk, reset, out);
  input a, clk, reset;
  output reg out;
  reg [1:0] state, ntst;
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

  always @(posedge clk or negedge reset) begin
    if (reset == 0)
      state <= S0;
    else
      state <= ntst;
  end

  always @(state, ntst, a) begin
    case (state)
      S0:
        if (a == 1) begin
          ntst = S1;
          out = 0;
        end else begin
          ntst = S0;
          out = 0;
        end

      S1:
        if (a == 1) begin
          ntst = S0;
          out = 0;
        end else begin
          ntst = S2;
          out = 0;
        end

      S2:
        if (a == 1) begin
          ntst = S1;
          out = 1;
        end else begin
          ntst = S0;
          out = 0;
        end
    endcase
  end
endmodule

module tb;
  reg a, clk, reset;
  wire out;

  mealy_machine f1 (
    .a(a),
    .clk(clk),
    .reset(reset),
    .out(out)
  );

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial begin
    reset = 0;
    a = 0;
    #2 reset = 1;
    #10 a = 0;
    #20 a = 1;
    #30 a = 1;
    #40 a = 0;
    #50 a = 1;
    #60 a = 1;
    #70 a = 0;
    #80 a = 1;
    #90 a = 0;
    #100 a = 1;
    #110 a = 0;
    #120 a = 0;
    #150 $finish;
  end
endmodule