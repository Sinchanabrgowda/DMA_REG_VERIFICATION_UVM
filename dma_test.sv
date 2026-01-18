class dma_test extends uvm_test;
  `uvm_component_utils(dma_test)
  
  dma_env dma_e;
  intr_reg_seq dma_reg_seq;
  
  function new(string name = "dma_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
    
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    dma_reg_seq = intr_reg_seq::type_id::create("dma_reg_seq");
    dma_reg_seq.dma_regmodel = dma_e.dma_regmodel;
    dma_reg_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass


  
  
  
  
