class dma_driver extends uvm_driver#(dma_seq_item);
  `uvm_component_utils(dma_driver)
  
  virtual dma_interface.driver_mod vif;
  
  function new(string name = "dma_driver", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dma_interface) :: get(this, "", "vif", vif))
      `uvm_fatal(get_full_name(),"DRV doesnt have interface");
  endfunction


  
  task drive();
    // WRITE operation
    if (req.wr_en) begin
      vif.driver_cb.rst_n   <= 1'b1;
      vif.driver_cb.wr_en <= 1'b1;
      vif.driver_cb.rd_en <= 1'b0;
      vif.driver_cb.addr  <= req.addr;
      vif.driver_cb.wdata <= req.wdata;

      `uvm_info("DRV",
        $sformatf("WRITE : addr=%0h wdata=%0h", req.addr, req.wdata),
        UVM_NONE);

      repeat(2) @(posedge vif.driver_cb);
    end

    // READ operation
    else if (req.rd_en) begin
      repeat(1) @(posedge vif.driver_cb);
      vif.driver_cb.rst_n   <= 1'b1;
      vif.driver_cb.wr_en <= 1'b0;
      vif.driver_cb.rd_en <= 1'b1;
      vif.driver_cb.addr  <= req.addr;
      vif.driver_cb.wdata <= '0;

      repeat(1) @(posedge vif.driver_cb);
      req.rdata = vif.driver_cb.rdata;

      `uvm_info("DRV",
        $sformatf("READ : addr=%0h rdata=%0h", req.addr, req.rdata),
        UVM_NONE);
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
