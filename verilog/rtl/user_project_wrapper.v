module user_project_wrapper (
    input  wire        wb_clk_i,
    input  wire        wb_rst_i,

    input  wire [37:0] io_in,
    output wire [37:0] io_out,

    input  wire        vdda1,
    input  wire        vdda2,
    input  wire        vssa1,
    input  wire        vssa2,
    input  wire        vccd1,
    input  wire        vccd2,
    input  wire        vssd1,
    input  wire        vssd2
);

    // Map IOs
    wire clk    = io_in[0];
    wire reset  = io_in[1];
    wire enable = io_in[2];
    wire [7:0] d = io_in[10:3];

    wire [7:0] q;

    register_8bit_en dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .d(d),
        .q(q)
    );

    // Drive outputs
    assign io_out[7:0] = q;

    // Unused outputs = 0
    assign io_out[37:8] = 30'b0;

endmodule
