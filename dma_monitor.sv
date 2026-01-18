class dma_monitor extends uvm_monitor;
  `uvm_component_utils(dma_monitor)
  
  uvm_analysis_port #(dma_seq_item)mon_port;
  
  virtual dma_interface vif;
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
      repeat(3) @(posedge vif.clk)
        mon_item.rdata = vif.rdata;
        mon_item.wdata = vif.wdata;
        mon_item.addr = vif.addr;
        mon_item.wr_en = vif.wr_en;
      
      mon_port.write(mon_item);
    end
    endtask
endclass

