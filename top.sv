`include "uvm_macros.svh"
`include "dma_pkg.sv"
`include "dma_interface.sv"
module top;
  bit clk =0;
  logic rst = 0;
  
  always #5 clk =~clk;
  
   import dma_pkg::*;
  import uvm_pkg::*;
  
  initial begin
    rst = 1'b1;
    #20 rst = 1'b0;
  end
  
  dma_interface vif(clk);
  
//   dma rtl_dma_inst(
//     .clk(clk),
//     .rst(rst),
//     .wdata(vif.wdata),
//     .rdata(vif.rdata),
//     .addr(vif.addr),
//     .wr_en(vif.wr_en)
//   );

  
  initial begin
    // set interface from top 
    uvm_config_db#(virtual dma_interface)::set(uvm_root::get(),"*","vif",vif);
  end
  
  initial begin
    run_test("dma_test");
    #100 $finish;
  end
endmodule
