module alu #(
  parameter WIDTH=8
  )(  input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [3:0]       opcode,

    output reg  [WIDTH-1:0] result,
    output reg              carry,
    output reg              overflow,
    output wire             zero,
    output wire             negative
);
assign zero     = (result == {WIDTH{1'b0}});
assign negative = result[WIDTH-1];
always @(*) begin
  result   = {WIDTH{1'b0}};
    carry    = 1'b0;
    overflow = 1'b0;
case (opcode)
   // ADD
4'b0000: begin
    {carry, result} = a + b;

    overflow = (~a[WIDTH-1] & ~b[WIDTH-1] & result[WIDTH-1]) |
               ( a[WIDTH-1] &  b[WIDTH-1] & ~result[WIDTH-1]);
end
// SUB
4'b0001: begin
    {carry, result} = a - b;

    overflow = (~a[WIDTH-1] &  b[WIDTH-1] & result[WIDTH-1]) |
               ( a[WIDTH-1] & ~b[WIDTH-1] & ~result[WIDTH-1]);
end
   // AND
    4'b0010: begin
        result = a & b;
    end

    // OR
    4'b0011: begin
        result = a | b;
    end

    // XOR
    4'b0100: begin
        result = a ^ b;
    end

    // NOT A
    4'b0101: begin
        result = ~a;
    end

    // Shift Left by 1
    4'b0110: begin
        result = a << 1;
    end

    // Shift Right by 1
    4'b0111: begin
        result = a >> 1;
    end

    // Increment
    4'b1000: begin
        {carry, result} = a + 1'b1;
    end

    // Decrement
    4'b1001: begin
        {carry, result} = a - 1'b1;
    end

    // Pass A
    4'b1010: begin
        result = a;
    end

    // Pass B
    4'b1011: begin
        result = b;
    end
    default: begin
        result = {WIDTH{1'b0}};
        end
    endcase

end
