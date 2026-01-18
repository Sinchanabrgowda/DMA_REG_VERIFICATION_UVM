class dma_base_reg_seq extends uvm_sequence;
  `uvm_object_utils(dma_base_reg_seq)

top_dma_reg_block dma_regmodel;

  function new (string name = "dma_base_reg_seq"); 
    super.new(name);
  endfunction

  uvm_status_e status;
  uvm_reg_data_t    rdata, rdata_m, dout_t;

endclass



class intr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(intr_reg_seq)
  
  function new (string name = "intr_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    // Read RO intr_status
    dma_regmodel.intr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    rdata   = dma_regmodel.intr_reg_inst.get();
    rdata_m = dma_regmodel.intr_reg_inst.get_mirrored_value();

    `uvm_info("INTR_SEQ",
      $sformatf("Read intr_status -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    // Write RW intr_mask
    dma_regmodel.intr_reg_inst.write(status, 32'hFFFF_0000, UVM_FRONTDOOR);

    // Read back
    dma_regmodel.intr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    rdata   = dma_regmodel.intr_reg_inst.get();
    rdata_m = dma_regmodel.intr_reg_inst.get_mirrored_value();

    `uvm_info("INTR_SEQ",
      $sformatf("After write -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    // Check RW field
    if (dout_t[31:16] != 16'hFFFF)
      `uvm_error("INTR_SEQ", "intr_mask RW failed")

  endtask
endclass




//ctrl_reg_seq

class ctrl_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(ctrl_reg_seq)
  
  function new (string name = "ctrl_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    uvm_reg_data_t wdata;

    wdata = '0;
    wdata[0]     = 1'b1;     // start_dma
    wdata[15:1]  = 15'd10;   // w_count
    wdata[16]    = 1'b1;     // io_mem

    dma_regmodel.ctrl_reg_inst.write(status, wdata, UVM_FRONTDOOR);

    rdata   = dma_regmodel.ctrl_reg_inst.get();
    rdata_m = dma_regmodel.ctrl_reg_inst.get_mirrored_value();

    dma_regmodel.ctrl_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    `uvm_info("CTRL_SEQ",
      $sformatf("Write CTRL -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    if (dout_t[0] != 0)
      `uvm_error("CTRL_SEQ", "start_dma did not self-clear")

    if (dout_t[15:1] != 15'd10)
      `uvm_error("CTRL_SEQ", "w_count mismatch")

    if (dout_t[16] != 1'b1)
      `uvm_error("CTRL_SEQ", "io_mem mismatch")

    if (dout_t[31:17] != 0)
      `uvm_error("CTRL_SEQ", "Reserved bits modified")

  endtask
endclass




//io_addr_reg_seq
class io_addr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(io_addr_reg_seq)
  
  function new (string name = "io_addr_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    dma_regmodel.io_addr_reg_inst.write(
      status, 32'h1000_0000, UVM_FRONTDOOR);

    rdata   = dma_regmodel.io_addr_reg_inst.get();
    rdata_m = dma_regmodel.io_addr_reg_inst.get_mirrored_value();

    dma_regmodel.io_addr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    `uvm_info("IO_ADDR_SEQ",
      $sformatf("IO_ADDR -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    if (dout_t != 32'h1000_0000)
      `uvm_error("IO_ADDR_SEQ", "IO_ADDR mismatch")

  endtask
endclass


//mem_Addr_reg_seq
class mem_addr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(mem_addr_reg_seq)
  
  function new (string name = "mem_addr_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    dma_regmodel.mem_addr_reg_inst.write(
      status, 32'h2000_0000, UVM_FRONTDOOR);

    rdata   = dma_regmodel.mem_addr_reg_inst.get();
    rdata_m = dma_regmodel.mem_addr_reg_inst.get_mirrored_value();

    dma_regmodel.mem_addr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    `uvm_info("MEM_ADDR_SEQ",
      $sformatf("MEM_ADDR -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    if (dout_t != 32'h2000_0000)
      `uvm_error("MEM_ADDR_SEQ", "MEM_ADDR mismatch")

  endtask
endclass


//extra_info_reg_seq
class extra_info_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(extra_info_reg_seq)
  
  function new (string name = "extra_info_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    dma_regmodel.extra_info_reg_inst.write(
      status, 32'hDEAD_BEEF, UVM_FRONTDOOR);

    rdata   = dma_regmodel.extra_info_reg_inst.get();
    rdata_m = dma_regmodel.extra_info_reg_inst.get_mirrored_value();

    dma_regmodel.extra_info_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    `uvm_info("EXTRA_INFO_SEQ",
      $sformatf("EXTRA_INFO -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    if (dout_t != 32'hDEAD_BEEF)
      `uvm_error("EXTRA_INFO_SEQ", "EXTRA_INFO mismatch")

  endtask
endclass


//status_reg_seq
class status_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(status_reg_seq)
  
  function new (string name = "status_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    uvm_reg_data_t before_val, after_val;

    dma_regmodel.status_reg_inst.read(status, before_val, UVM_FRONTDOOR);
    dma_regmodel.status_reg_inst.write(status, 32'hFFFF_FFFF, UVM_FRONTDOOR);
    dma_regmodel.status_reg_inst.read(status, after_val, UVM_FRONTDOOR);

    `uvm_info("STATUS_SEQ",
      $sformatf("STATUS before:%h after:%h", before_val, after_val),
      UVM_LOW)

    if (before_val != after_val)
      `uvm_error("STATUS_SEQ", "RO STATUS modified!")

  endtask
endclass



//trandfer_count_reg_seq
class transfer_count_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(transfer_count_reg_seq)
  
  function new (string name = "transfer_count_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    dma_regmodel.transfer_count_reg_inst.read(
      status, dout_t, UVM_FRONTDOOR);

    rdata   = dma_regmodel.transfer_count_reg_inst.get();
    rdata_m = dma_regmodel.transfer_count_reg_inst.get_mirrored_value();

    `uvm_info("XFER_CNT_SEQ",
      $sformatf("TRANSFER_COUNT -> Des:%0d Mir:%0d Read:%0d",
                rdata, rdata_m, dout_t),
      UVM_LOW)

  endtask
endclass



//descriptor_reg_seq
class descriptor_addr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(descriptor_addr_reg_seq)
  
  function new (string name = "descriptor_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    dma_regmodel.descriptor_addr_reg_inst.write(
      status, 32'h3000_0000, UVM_FRONTDOOR);

    rdata   = dma_regmodel.descriptor_addr_reg_inst.get();
    rdata_m = dma_regmodel.descriptor_addr_reg_inst.get_mirrored_value();

    dma_regmodel.descriptor_addr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    `uvm_info("DESC_ADDR_SEQ",
      $sformatf("DESC_ADDR -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    if (dout_t != 32'h3000_0000)
      `uvm_error("DESC_ADDR_SEQ", "Descriptor addr mismatch")

  endtask
endclass



//error_status_reg_seq
class error_status_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(error_status_reg_seq)
  
  function new (string name = "error_status_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    uvm_reg_data_t before_val, after_val;

    dma_regmodel.error_status_reg_inst.read(status, before_val, UVM_FRONTDOOR);

    // clear RW1C bits
    dma_regmodel.error_status_reg_inst.write(
      status, 32'h0000_001F, UVM_FRONTDOOR);

    dma_regmodel.error_status_reg_inst.read(status, after_val, UVM_FRONTDOOR);

    `uvm_info("ERROR_SEQ",
      $sformatf("ERROR_STATUS before:%h after:%h", before_val, after_val),
      UVM_LOW)

    if (after_val[4:0] != 0)
      `uvm_error("ERROR_SEQ", "RW1C bits not cleared")

    if (after_val[31:5] != before_val[31:5])
      `uvm_error("ERROR_SEQ", "RO fields modified")

  endtask
endclass



//config_reg
class config_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(config_reg_seq)
  
  function new (string name = "config_reg_seq"); 
    super.new(name);
  endfunction

  task body();

    dma_regmodel.config_reg_inst.write(
      status, 32'h0000_01AF, UVM_FRONTDOOR);

    rdata   = dma_regmodel.config_reg_inst.get();
    rdata_m = dma_regmodel.config_reg_inst.get_mirrored_value();

    dma_regmodel.config_reg_inst.read(status, dout_t, UVM_FRONTDOOR);

    `uvm_info("CONFIG_SEQ",
      $sformatf("CONFIG -> Des:%h Mir:%h Read:%h",
                rdata, rdata_m, dout_t),
      UVM_LOW)

    if (dout_t[31:9] != 0)
      `uvm_error("CONFIG_SEQ", "Reserved bits modified")

  endtask
endclass




//top_reg_seq
class top_dma_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(top_dma_reg_seq)
  
  function new (string name = "top_dma_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    intr_reg_seq          intr_seq;
    ctrl_reg_seq          ctrl_seq;
    io_addr_reg_seq       io_seq;
    mem_addr_reg_seq      mem_seq;
    extra_info_reg_seq    extra_seq;
    status_reg_seq        status_seq;
    transfer_count_reg_seq xfer_seq;
    descriptor_addr_reg_seq desc_seq;
    error_status_reg_seq  err_seq;
    config_reg_seq        cfg_seq;

    `uvm_info("DMA_ALL_SEQ",
      "Starting full DMA register verification sequence", UVM_LOW)

    intr_seq = intr_reg_seq::type_id::create("intr_seq");
    intr_seq.dma_regmodel = dma_regmodel;
    intr_seq.start(m_sequencer);

    ctrl_seq = ctrl_reg_seq::type_id::create("ctrl_seq");
    ctrl_seq.dma_regmodel = dma_regmodel;
    ctrl_seq.start(m_sequencer);

    io_seq = io_addr_reg_seq::type_id::create("io_seq");
    io_seq.dma_regmodel = dma_regmodel;
    io_seq.start(m_sequencer);

    mem_seq = mem_addr_reg_seq::type_id::create("mem_seq");
    mem_seq.dma_regmodel = dma_regmodel;
    mem_seq.start(m_sequencer);

    extra_seq = extra_info_reg_seq::type_id::create("extra_seq");
    extra_seq.dma_regmodel = dma_regmodel;
    extra_seq.start(m_sequencer);

    status_seq = status_reg_seq::type_id::create("status_seq");
    status_seq.dma_regmodel = dma_regmodel;
    status_seq.start(m_sequencer);

    xfer_seq = transfer_count_reg_seq::type_id::create("xfer_seq");
    xfer_seq.dma_regmodel = dma_regmodel;
    xfer_seq.start(m_sequencer);

    desc_seq = descriptor_addr_reg_seq::type_id::create("desc_seq");
    desc_seq.dma_regmodel = dma_regmodel;
    desc_seq.start(m_sequencer);

    err_seq = error_status_reg_seq::type_id::create("err_seq");
    err_seq.dma_regmodel = dma_regmodel;
    err_seq.start(m_sequencer);

    cfg_seq = config_reg_seq::type_id::create("cfg_seq");
    cfg_seq.dma_regmodel = dma_regmodel;
    cfg_seq.start(m_sequencer);

    `uvm_info("DMA_ALL_SEQ",
      "DMA register verification sequence completed", UVM_LOW)
  endtask
endclass
