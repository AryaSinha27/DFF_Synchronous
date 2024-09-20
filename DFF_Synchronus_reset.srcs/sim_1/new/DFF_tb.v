module DFF_tb;
    reg clk, rst_n;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    DFF dff (.clk(clk), .rst_n(rst_n), .d(d), .q(q));

    // Generate clock with period of 4 units
    always #2 clk = ~clk;

    // Stimulus generation
    initial begin
        clk = 0; rst_n = 0; d = 0; 
        
        // Reset and start test case 1
        #3 rst_n = 1;
        repeat(6) begin
            d = $urandom_range(0, 1);
            #3;
        end
        
        // Reset again and start test case 2
        rst_n = 0; 
        #3 rst_n = 1;
        repeat(6) begin
            d = $urandom_range(0, 1);
            #3;
        end
        
        // Finish the simulation
        $finish;
    end

    // Dump waveform to a file for later viewing
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1, DFF_tb);
    end

endmodule
