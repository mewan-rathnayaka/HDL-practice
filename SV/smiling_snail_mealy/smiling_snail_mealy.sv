module smiling_snail(
    input logic data, rstn, clk,
    output logic detected
);
    enum {s1, s2, s3, s4} state, next_state;

    always_comb begin
        unique case (state)
            s1: next_state = (data) ? s2 : s1;
            s2: next_state = (data) ? s3 : s1;
            s3: next_state = (data) ? s3 : s4;
            s4: next_state = (data) ? s2 : s1;
        endcase
    end

    always_ff @(posedge clk or negedge rstn) begin
        state <= !rstn ? s1 : next_state;
    end

    assign detected = (state == s4 && data) ? 1 : 0;    
endmodule