module clk_divider_fsm (
    input  logic clk,rstn,
    output logic clk_out
);  
    enum  {s1, s2 , s3 } state, next_state;

    always_comb begin
        unique case (state)
            s1: next_state = s2;
            s2: next_state = s3;
            s3: next_state = s1;
        endcase
    end

    always_ff @(posedge clk or negedge rstn) begin
        state <= !rstn ? s1 : next_state;        
    end

    always_ff @(posedge clk) begin
        unique case (state)
            s1 : clk_out <= 1;
            s2 : clk_out <= 0;
            s3 : clk_out <= 0; 
        endcase
    end
endmodule