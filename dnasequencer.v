module dnasequencer (
    input clk,
    input rst,
    input [1:0] dna_in,
    output reg match
);

reg [2:0] state, next_state;

parameter S0=3'd0;
parameter S1=3'd1;
parameter S2=3'd2;
parameter S3=3'd3;
parameter S4=3'd4;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <=S0;
    else
        state <=next_state;
end

always @(*) begin
    case (state)
        S0: next_state=(dna_in == 2'b00) ? S1 : S0;
        S1: next_state=(dna_in == 2'b01) ? S2 : (dna_in==2'b00) ? S1 : S0;
        S2: next_state=(dna_in == 2'b11) ? S3 : (dna_in==2'b00) ? S1 : S0;
        S3: next_state=(dna_in == 2'b10) ? S4 : (dna_in==2'b00) ? S1 : S0;
        S4: next_state=S0;
        default: next_state = S0;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        match <=0;
    else
        match <=(next_state == S4) ? 1 : 0;
end

endmodule
