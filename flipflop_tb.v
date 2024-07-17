`timescale 1ns/1ps
module flipflop_tb;
    reg clk, rst_n;
    reg in1, in2;
    wire out;

    // Instantiate the top module
    flipflop u_flipflop (
        .clk(clk),
        .rst_n(rst_n),
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    // Generate input signals
    initial begin
        in1 = 1'b0;
        in2 = 1'b0;
        #100;
        @(posedge clk);
        #1ps in1 = 1;
        @(posedge clk);
        #1ps in1 = 0;
        @(posedge clk);
        #1ps in2 = 1;
        @(posedge clk);
        #1ps in2 = 0;
        
        #100;
        $finish;
    end

    // Generate clock signal
    initial begin
        clk = 0;
        forever begin 
            #25 clk = ~clk;
        end
    end

    // Generate reset signal
    initial begin
        rst_n = 1'b0;
        #50;
        rst_n = 1'b1;
    end
endmodule
