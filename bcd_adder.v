module bcd_adder (
    input [3:0] A,         // 4-bit BCD input A
    input [3:0] B,         // 4-bit BCD input B
    input cin,             // Carry-in
    output [3:0] sum,      // 4-bit BCD sum
    output cout            // Carry-out
);

    wire [4:0] temp_sum;   // 5-bit to hold intermediate sum
    wire carry_adjust;     // Carry needed for BCD adjustment

    // Compute the initial sum
    assign temp_sum = A + B + cin;

    // Determine if adjustment is needed (if sum > 9)
    assign carry_adjust = temp_sum > 9;

    // Adjust the sum if necessary
    assign sum = carry_adjust ? (temp_sum - 10) : temp_sum[3:0];

    // Determine the carry-out (1 if adjustment needed, else from temp_sum)
    assign cout = carry_adjust || temp_sum[4];

endmodule
