class dma_env extends uvm_env;
  `uvm_component_utils(dma_env)
  
  dma_agent dma_agt;
  top_dma_reg_block dma_regmodel;
  top_dma_adapter dma_adapter;
  uvm_reg_predictor #(dma_seq_item) dma_predictor_inst;
  dma_subscriber dma_subscrb;
  
  function new(string name = "dma_env", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_predictor_inst = uvm_reg_predictor#(dma_seq_item)::type_id::create("dma_predictor_inst", this);
    dma_agt = dma_agent::type_id::create("dma_agt", this);
    dma_subscrb = dma_subscriber::type_id::create("dma_subscrb", this);
    dma_regmodel = top_dma_reg_block::type_id::create("dma_regmodel", this);
    dma_regmodel.build();
    dma_adapter = top_dma_adapter::type_id::create("dma_adapter", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    dma_agt.dma_mon.mon_port.connect(dma_subscrb.subscrb_port);
    
    dma_regmodel.default_map.set_sequencer(.sequencer(dma_agt.seqr),.adapter(dma_adapter));
    dma_regmodel.default_map.set_base_addr(0);
    
    dma_predictor_inst.map = dma_regmodel.default_map;
    dma_predictor_inst.adapter = dma_adapter;
    
    dma_agt.dma_mon.mon_port.connect(dma_predictor_inst.bus_in);
    
    dma_regmodel.default_map.set_auto_predict(0);
  endfunction
  
endclass


    
