class top_dma_adapter extends uvm_reg_adapter;
  `uvm_object_utils(top_dma_adapter)
  
  function new(string name = "top_dma_adapter");
    super.new(name);
  endfunction
  
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    dma_seq_item dma_item;
    dma_item = dma_seq_item::type_id::create("dma_item");
    dma_item.wr_en = (rw.kind == UVM_WRITE);
    dma_item.rd_en = (rw.kind == UVM_READ);
    dma_item.addr = rw.addr;
    if(rw.kind == UVM_WRITE) dma_item.wdata = rw.data;
    return dma_item;
  endfunction
  
  function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    dma_seq_item dma_item;
    assert($cast(dma_item, bus_item));
    
    if(dma_item.wr_en) begin
      rw.kind = UVM_WRITE;
      rw.data = dma_item.wdata;
    end
    
    else if(dma_item.rd_en) begin
      rw.kind = UVM_READ;
      rw.data = dma_item.rdata;
    end 
      
    
   
	rw.addr = dma_item.addr;
	rw.status = UVM_IS_OK;
  endfunction
  
endclass


