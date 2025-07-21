module tb_dnasequencer;

reg clk, rst;
reg [1:0] dna_in;
wire match;

dnasequencer uut (
    .clk(clk),
    .rst(rst),
    .dna_in(dna_in),
    .match(match)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("dna_seq.vcd");
    $dumpvars(0, tb_dnasequencer);

    rst = 1; #10; rst = 0;

    dna_in = 2'b00; #10; 
    dna_in = 2'b01; #10; 
    dna_in = 2'b11; #10; 
    dna_in = 2'b10; #10; 

    dna_in = 2'b11; #10;
    dna_in = 2'b00; #10;
    dna_in = 2'b01; #10;
    dna_in = 2'b11; #10;
    dna_in = 2'b10; #10;

    rst= 1;
    #10;
    rst=0;#10;
        dna_in = 2'b10; #10;

   dna_in = 2'b11; #10;
    dna_in = 2'b00; #10;
    dna_in = 2'b01; #10;
    dna_in = 2'b10; #10;
    $finish;
end

endmodule
