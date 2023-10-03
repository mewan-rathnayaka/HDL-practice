module smiling_snail(
    input logic data, clk, rstn,
    output logic detected
);
    enum {s0, s1, s2, s3, s4} state, next_state;

    always_comb begin
        unique case (state)
            s0: next_state = (data) ? s1 : s0;
            s1: next_state = (data) ? s2 : s0;
            s2: next_state = (data) ? s2 : s3;
            s3: next_state = (data) ? s4 : s0;
            s4: next_state = (data) ? s2 : s0;
        endcase
    end

    always_ff @(posedge clk or negedge rstn) begin
        state <= !rstn ? s0 : next_state;
    end
    
    assign detected = (state == s4) ? 1 : 0;     
endmodule