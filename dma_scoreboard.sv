// class dma_scoreboard extends uvm_scoreboard;
//   `uvm_component_utils(dma_scoreboard)
  
//   uvm_analysis_imp#(dma_scoreboard, dma_seq_item) scb_port;
  
//   function new(string name = "dma_scoreboard", uvm_component parent);
//     super.new(name, parent);
//   endfunction
  
//   function void build_phase(uvm_phase phase);
//     super.build_phase(phase);
//     scb_port = new("scb_port", this);
//   endfunction
  
// //   function void write(dma_seq_item scb_item);
// //     `uvm_info("SCO", $sformatf("Wr_en :%0d , Addr : %0d, wdata:%0d, rdata:%0d", scb_item.wr_en, scb_item.addr, scb_item.wdata, scb_item.rdata), UVM_NONE)
// //     if(scb_item.wr_en == 1'b1)
  
// endclass
