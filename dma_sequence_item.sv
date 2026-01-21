`include "dma_defines.sv"

class dma_seq_item extends uvm_sequence_item;
  
  rand bit [`data_width-1 : 0] wdata;
  rand bit [`data_width-1 : 0] rdata;
  rand bit [`addr_width-1 : 0] addr;
  rand bit wr_en;
  rand bit rd_en;
  rand bit rst_n;
  
  function new(string name = "dma_seq_item");
    super.new(name);
  endfunction
  
  
  `uvm_object_utils_begin(dma_seq_item)
  `uvm_field_int(wdata, UVM_ALL_ON)
  `uvm_field_int(rdata, UVM_ALL_ON)
  `uvm_field_int(addr, UVM_ALL_ON)
  `uvm_field_int(wr_en, UVM_ALL_ON)
  `uvm_field_int(rd_en, UVM_ALL_ON)
  `uvm_field_int(rst_n, UVM_ALL_ON)
  `uvm_object_utils_end
  
  constraint c1{ wr_en != rd_en;}
endclass
