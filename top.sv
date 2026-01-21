`include "uvm_macros.svh"
`include "dma_pkg.sv"
`include "dma_interface.sv"
`include "design.sv"
module top;
  bit clk =0;
  logic rst_n = 0;
  
  always #5 clk =~clk;
  
   import dma_pkg::*;
  import uvm_pkg::*;
  
  initial begin
    rst_n = 1'b0;
    #20 rst_n = 1'b1;
  end
  
  dma_interface vif(clk);
  
  dma_design_ dut(
    .clk(clk),
      .rst_n(rst_n),
    .wdata(vif.wdata),
    .rdata(vif.rdata),
    .addr(vif.addr),
    .wr_en(vif.wr_en),
  	   .rd_en(vif.rd_en)
  );

  
  initial begin
    // set interface from top 
    uvm_config_db#(virtual dma_interface)::set(uvm_root::get(),"*","vif",vif);
  end
  
  initial begin
    run_test("dma_regression_test");
    #100 $finish;
  end
endmodule
  
