class dma_monitor extends uvm_monitor;
  `uvm_component_utils(dma_monitor)
  
  uvm_analysis_port #(dma_seq_item)mon_port;
  
  virtual dma_interface.monitor_mod vif;
  dma_seq_item mon_item;
  
  function new(string name = "dma_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_port = new("mon_port", this);
    if(! uvm_config_db #(virtual dma_interface):: get(this, "", "vif", vif))
      `uvm_fatal(get_full_name(),"MONITOR doesnt have interface");
  endfunction
  
  task run_phase(uvm_phase phase);
    mon_item = dma_seq_item::type_id::create("mon_item");
    forever begin
      repeat(2) @(posedge vif.monitor_cb)
        mon_item.rst_n = vif.monitor_cb.rst_n;
        mon_item.rdata = vif.monitor_cb.rdata;
        mon_item.wdata = vif.monitor_cb.wdata;
        mon_item.addr = vif.monitor_cb.addr;
        mon_item.wr_en = vif.monitor_cb.wr_en;
        mon_item.rd_en = vif.monitor_cb.rd_en;
      
      `uvm_info("MON",
                $sformatf("MON : addr=%0h wdata=%0h rdata = %0h wr_en = %0h rd_en = %0h", mon_item.addr, mon_item.wdata, mon_item.rdata, mon_item.wr_en, mon_item.rd_en),
        UVM_NONE);
      mon_port.write(mon_item);
    end
    endtask
endclass

