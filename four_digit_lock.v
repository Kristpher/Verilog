module four_digit_lock(input [2:0]sw,
  input clk,
  input reset,
  output reg [1:0] sel,
  output reg alarm,
  output reg locked,
  output reg entimer
);
  

  parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, wrong = 3'b100, right = 3'b101;
reg [3:0] count=0;
  reg [2:0] state, ntst=S0;
  always @(posedge clk) begin
    if (reset) begin
      alarm <= 0;
      locked <= 1;
      entimer <= 0;
      sel <= 2'b00;
      state <= S0;
    end else begin
      state = ntst;
      case (state)
        S0:
          begin
            alarm <= 0;
            locked <= 1;
            sel <= 2'b00;
            entimer <= 0;
            
            if (sw == 0) begin
              ntst <= S1;
            end else begin
              ntst <= wrong;
            end
          end

        S1:
          begin
            alarm <= 0;
            locked <= 1;
            sel <= 2'b01;
            entimer <= 0;
            if (sw == 1) begin
              ntst <= S2;
            end else begin
              ntst <= wrong;
            end
          end

        S2:
          begin
            alarm <= 0;
            locked <= 1;
            sel <= 2'b10;
            entimer <= 0;
            if (sw==2) begin
              ntst <= S3;
            end else begin
              ntst <= wrong;
            end
          end

        S3:
          begin
            alarm <= 0;
            locked <= 1;
            sel <= 2'b11;
            entimer <= 0;
            if (sw==3) begin
              ntst <= right;
            end else begin
              ntst <= wrong;
            end
          end

        wrong:
          begin
            alarm <= 1;
            locked <= 1;
            entimer <= 0;
            sel <= 2'b00;  
            ntst <= wrong;  
          end

        right:
          begin
            locked <= 0;
            alarm <= 0;
            entimer <= 1;
            sel <= 2'b00;  
            if (count == 9) begin
              count <= 0;
              ntst <= S0;
            end else begin
              count <= count + 1;
              ntst <= right;
            end
          end
      endcase
    end
  end
endmodule

module tb;
reg [2:0]sw;
reg clk,reset;
wire entimer;
wire alarm,locked;
wire [1:0] sel;
four_digit_lock f1(.sw(sw),.clk(clk),.reset(reset),.entimer(entimer),.alarm(alarm),.locked(locked),.sel(sel));
initial begin
		clk=0;
		forever #5 clk=~clk;
	end
	initial #500 $finish;
	initial begin
	reset=0;
		reset=1;
		reset=0;
		sw=0;
		#10 sw=1;
		#10 sw=2;
		#10 sw=3;
		#100 sw=4;
		#10 sw=5;
		#10 sw=6;
		#10 sw=2;
		#10 sw=3;
		
	end
endmodule
