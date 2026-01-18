class dma_agent extends uvm_agent;
  `uvm_component_utils(dma_agent)
  
  dma_driver dma_drv;
  //dma_sequencer dma_seqr;
  uvm_sequencer#(dma_seq_item) seqr;
  dma_monitor dma_mon;
  
  function new(string name = "dma_agent", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_drv = dma_driver::type_id::create("dma_drv", this);
    dma_mon = dma_monitor::type_id::create("dma_mon", this);
    //dma_seqr = dma_sequencer::type_id::create("dma_seqr", this);
    seqr = uvm_sequencer#(dma_seq_item)::type_id::create("seqr", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   // dma_drv.seq_item_port.connect(dma_seqr.seq_item_export);
    dma_drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass

