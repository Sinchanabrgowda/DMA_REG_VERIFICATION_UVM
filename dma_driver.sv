class dma_driver extends uvm_driver#(dma_seq_item);
  `uvm_component_utils(dma_driver)
  
  virtual dma_interface vif;
  
  function new(string name = "dma_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dma_interface) :: get(this, "", "vif", vif))
      `uvm_fatal(get_full_name(),"DRV doesnt have interface");
  endfunction
  
  task reset_dut();
    @(posedge vif.clk);
    vif.rst <= 1'b1;
    vif.wr_en <= 1'b0;
    vif.wdata <= 'b0;
    vif.addr <= 'b0;
    
    repeat(5) @(posedge vif.clk);
    `uvm_info("DRV", "SYSYTEM RESET", UVM_NONE);
    vif.rst <= 1'b0;
  endtask
  
  task drive();
    vif.rst <= 1'b0;
    vif.wr_en <= req.wr_en;
    vif.addr <= req.addr;
    if(req.wr_en == 1'b1)
      begin
        vif.wdata <= req.wdata;
        `uvm_info("DRV", $sformatf("Data write -> Wdata : %0d", req.wdata), UVM_NONE);
        repeat(3) @(posedge vif.clk);
      end  
  endtask
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done();
    end
  endtask
  
endclass
