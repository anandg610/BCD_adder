module bcd_adder_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg cin;

    // Outputs
    wire [3:0] sum;
    wire cout;

    // Instantiate the BCD Adder
    bcd_adder uut (
        .A(A),
        .B(B),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Testbench procedure
    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        cin = 0;

        // Display header
        $display("A    B    cin | Sum   Cout");
        $display("---------------------------");

        // Test case 1: 1 + 2 + 0 = 3
        A = 4'b0001; B = 4'b0010; cin = 0;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 2: 9 + 1 + 0 = 10 (BCD: 0000, Carry: 1)
        A = 4'b1001; B = 4'b0001; cin = 0;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 3: 6 + 5 + 0 = 11 (BCD: 0001, Carry: 1)
        A = 4'b0110; B = 4'b0101; cin = 0;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 4: 9 + 9 + 1 = 19 (BCD: 0001, Carry: 1)
        A = 4'b1001; B = 4'b1001; cin = 1;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 5: 5 + 5 + 1 = 11 (BCD: 0001, Carry: 1)
        A = 4'b0101; B = 4'b0101; cin = 1;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 6: 8 + 3 + 0 = 11 (BCD: 0001, Carry: 1)
        A = 4'b1000; B = 4'b0011; cin = 0;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 7: 0 + 0 + 0 = 0
        A = 4'b0000; B = 4'b0000; cin = 0;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Test case 8: 9 + 9 + 1 = 19 (BCD: 0001, Carry: 1)
        A = 4'b1001; B = 4'b1001; cin = 1;
        #10;
        $display("%b  %b   %b  | %b    %b", A, B, cin, sum, cout);

        // Finish simulation
        $finish;
    end

endmodule
