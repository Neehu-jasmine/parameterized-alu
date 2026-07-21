 `timescale 1ns / 1ps

module alu_tb;

    parameter WIDTH = 8;

    // Inputs
    reg [WIDTH-1:0] a;
    reg [WIDTH-1:0] b;
    reg [3:0] opcode;

    // Outputs
    wire [WIDTH-1:0] result;
    wire carry;
    wire overflow;
    wire zero;
    wire negative;

    // Instantiate the ALU
    alu #(
        .WIDTH(WIDTH)
    ) dut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .result(result),
        .carry(carry),
        .overflow(overflow),
        .zero(zero),
        .negative(negative)
    );

    initial begin

        $display("===============================================");
        $display("       PARAMETERIZED ALU TESTBENCH");
        $display("===============================================");

        // Test 1 : ADD
        a = 8'd10;
        b = 8'd20;
        opcode = 4'b0000;
        #10;
        $display("ADD      : A=%0d B=%0d Result=%0d Carry=%b Overflow=%b Zero=%b Negative=%b",
                 a,b,result,carry,overflow,zero,negative);

        // Test 2 : SUB
        a = 8'd30;
        b = 8'd10;
        opcode = 4'b0001;
        #10;
        $display("SUB      : A=%0d B=%0d Result=%0d Carry=%b Overflow=%b Zero=%b Negative=%b",
                 a,b,result,carry,overflow,zero,negative);

        // Test 3 : AND
        a = 8'b11001100;
        b = 8'b10101010;
        opcode = 4'b0010;
        #10;
        $display("AND      : Result = %h", result);

        // Test 4 : OR
        opcode = 4'b0011;
        #10;
        $display("OR       : Result = %h", result);

        // Test 5 : XOR
        opcode = 4'b0100;
        #10;
        $display("XOR      : Result = %h", result);

        // Test 6 : NOT
        opcode = 4'b0101;
        #10;
        $display("NOT      : Result = %h", result);

        // Test 7 : Shift Left
        opcode = 4'b0110;
        #10;
        $display("SHIFT L  : Result = %h", result);

        // Test 8 : Shift Right
        opcode = 4'b0111;
        #10;
        $display("SHIFT R  : Result = %h", result);

        // Test 9 : Increment
        a = 8'd50;
        opcode = 4'b1000;
        #10;
        $display("INC      : Result = %0d", result);

        // Test 10 : Decrement
        opcode = 4'b1001;
        #10;
        $display("DEC      : Result = %0d", result);

        // Test 11 : Pass A
        opcode = 4'b1010;
        #10;
        $display("PASS A   : Result = %0d", result);

        // Test 12 : Pass B
        b = 8'd77;
        opcode = 4'b1011;
        #10;
        $display("PASS B   : Result = %0d", result);

        // Test 13 : Overflow Test
        a = 8'd127;
        b = 8'd1;
        opcode = 4'b0000;
        #10;
        $display("OVERFLOW : Result=%0d Overflow=%b", result, overflow);

        // Test 14 : Carry Test
        a = 8'hFF;
        b = 8'h01;
        opcode = 4'b0000;
        #10;
        $display("CARRY    : Result=%h Carry=%b", result, carry);

        // Test 15 : Zero Flag Test
        a = 8'd10;
        b = 8'd10;
        opcode = 4'b0001;
        #10;
        $display("ZERO     : Result=%0d Zero=%b", result, zero);

        // Test 16 : Negative Flag Test
        a = 8'd10;
        b = 8'd20;
        opcode = 4'b0001;
        #10;
        $display("NEGATIVE : Result=%h Negative=%b", result, negative);

        $display("===============================================");
        $display("        ALL TESTS COMPLETED");
        $display("===============================================");

        $finish;

    end
endmodule 
