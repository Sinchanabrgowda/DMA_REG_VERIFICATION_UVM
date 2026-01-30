//intr reg
class intr_reg extends uvm_reg;
  `uvm_object_utils(intr_reg)

  rand uvm_reg_field intr_status;
  rand uvm_reg_field intr_mask;

  //coverage
  covergroup intr_status_cov;
    option.per_instance = 1;
    coverpoint intr_status.value[15:0]
    {
      bins intr_status_bin = {[16'h0000 : 16'hFFFF]};
    }
  endgroup

  covergroup intr_mask_cov;
    option.per_instance = 1;
    coverpoint intr_mask.value[31:16]
    {
      bins intr_mask_bin = {[16'h0000 : 16'hFFFF]};
    }
  endgroup


  function new(string name = "intr_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS)) begin
    intr_status_cov = new();
    intr_mask_cov = new();
    end
  endfunction

  //sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    intr_status_cov.sample();
    intr_mask_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    intr_status_cov.sample();
    intr_mask_cov.sample();
  endfunction


  //build func
  function void build;
    intr_status = uvm_reg_field::type_id::create("intr_status");
    intr_status.configure(this, 16, 0, "RO", 0, 16'h0, 1, 0, 1);
    intr_mask = uvm_reg_field::type_id::create("intr_mask");
    intr_mask.configure(this, 16, 16, "RW", 0, 16'h0, 1, 1, 1);
  endfunction

endclass


// ctrl reg
class ctrl_reg extends uvm_reg;
  `uvm_object_utils(ctrl_reg)

  rand uvm_reg_field start_dma;
  rand uvm_reg_field w_count;
  rand uvm_reg_field io_mem;
  uvm_reg_field reserved;

  //covergroup
covergroup start_dma_cov;
    option.per_instance = 1;
   coverpoint start_dma.value[0]
   {
     bins start_dma  = {0, 1};
    }
  endgroup


covergroup w_count_cov;
    option.per_instance = 1;
   coverpoint w_count.value[15:1] {
     bins low = {[0:16]};
      bins med = {[17:32]};
      bins high = {[33:32767]}; 
    }
  endgroup

  covergroup io_mem_cov;
    option.per_instance = 1;
    coverpoint io_mem.value[16] {
      bins io_to_mem = {0, 1};
    }
  endgroup



  //func new
  function new(string name = "ctrl_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS)) begin
      start_dma_cov = new();
      w_count_cov   = new();
      io_mem_cov    = new();
    end
  endfunction


  //sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    start_dma_cov.sample();
    w_count_cov.sample();
    io_mem_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    start_dma_cov.sample();
    w_count_cov.sample();
    io_mem_cov.sample();
  endfunction


  function void build;
    start_dma = uvm_reg_field::type_id::create("start_dma");
    start_dma.configure(this, 1, 0, "RW", 0, 1'h0, 1, 1, 1);
    w_count = uvm_reg_field::type_id::create("w_count");
    w_count.configure(this, 15, 1, "RW", 0, 16'h0, 1, 1, 1);
    io_mem = uvm_reg_field::type_id::create("io_mem");
    io_mem.configure(this, 1, 16, "RW", 0, 1'h0, 1, 1, 1);
    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 15, 17, "RO", 0, 16'h0, 1, 0, 1);
  endfunction

endclass


//io_addr_reg
class io_addr_reg extends uvm_reg;
  `uvm_object_utils(io_addr_reg)

  rand uvm_reg_field io_addr;

  //covergroup
  covergroup io_addr_cov;
    option.per_instance = 1;
    coverpoint io_addr.value[31:0] {
      bins low     = {[32'h0000_0000 : 32'h0FFF_FFFF]}; 
      bins med  = {[32'h1000_0000 : 32'h7FFF_FFFF]}; 
      bins high    = {[32'h8000_0000 : 32'hFFFF_FFFF]}; 
    }
  endgroup

  //func new
  function new(string name = "io_addr_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS)) begin
      io_addr_cov = new();
    end
  endfunction

  //sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    io_addr_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    io_addr_cov.sample();
  endfunction

  function void build;
    io_addr = uvm_reg_field::type_id::create("io_addr");
    io_addr.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
  endfunction

endclass


//mem_addr
class mem_addr_reg extends uvm_reg;
  `uvm_object_utils(mem_addr_reg)

  rand uvm_reg_field mem_addr;

  //covergroup
  covergroup mem_addr_cov;
    option.per_instance = 1;
    coverpoint mem_addr.value[31:0] {
      bins low     = {[32'h0000_0000 : 32'h0FFF_FFFF]}; 
      bins med  = {[32'h1000_0000 : 32'h7FFF_FFFF]}; 
      bins high    = {[32'h8000_0000 : 32'hFFFF_FFFF]}; 
    }
  endgroup

  function new(string name = "mem_addr_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS)) begin
      mem_addr_cov = new();
    end
  endfunction


  //sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    mem_addr_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    mem_addr_cov.sample();
  endfunction


  function void build;
    mem_addr = uvm_reg_field::type_id::create("mem_addr");
    mem_addr.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
  endfunction

endclass

//exrta_info_reg
class extra_info_reg extends uvm_reg;
  `uvm_object_utils(extra_info_reg)

  rand uvm_reg_field extra_info;

  //covergroup
  covergroup extra_info_cov;
    option.per_instance = 1;
    coverpoint extra_info.value[31:0] {
      bins low     = {[32'h0000_0000 : 32'h0FFF_FFFF]}; 
      bins med  = {[32'h1000_0000 : 32'h7FFF_FFFF]}; 
      bins high    = {[32'h8000_0000 : 32'hFFFF_FFFF]}; 
    }
  endgroup

  function new(string name = "extra_info_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS)) begin
      extra_info_cov = new();
    end
  endfunction

  //sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    extra_info_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
    extra_info_cov.sample();
  endfunction

  function void build;
    extra_info = uvm_reg_field::type_id::create("extra_info");
    extra_info.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
  endfunction

endclass


//status_reg
class status_reg extends uvm_reg;
  `uvm_object_utils(status_reg)

  rand uvm_reg_field busy;
  rand uvm_reg_field done;
 rand uvm_reg_field error;
  rand uvm_reg_field paused;
  rand uvm_reg_field current_state;
  rand uvm_reg_field fifo_level;
  uvm_reg_field reserved;

  ///covergroup
  covergroup busy_cov;
    option.per_instance = 1;
    coverpoint busy.value[0] {
      bins busy_bin = {0, 1};
    }
  endgroup

  covergroup done_cov;
    option.per_instance = 1;
    coverpoint done.value[1] {
      bins done_bin = {0, 1};
    }
  endgroup

  covergroup error_cov;
    option.per_instance = 1;
    coverpoint error.value[2] {
      bins error_bin = {0, 1};
    }
  endgroup

  covergroup paused_cov;
    option.per_instance = 1;
    coverpoint paused.value[3] {
      bins paused_bin = {0, 1};
    }
  endgroup

  covergroup current_state_cov;
    option.per_instance = 1;
    coverpoint current_state.value[7:4] {
      bins all_states = {0, 1, 2, 3};
    }
  endgroup

  covergroup fifo_level_cov;
    option.per_instance = 1;
    coverpoint fifo_level.value[15:8]{
      bins low    = {[0:63]};
      bins mid    = {[64:127]};
      bins high   = {[128:255]};
    }
  endgroup



  function new(string name = "status_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS)) begin
      busy_cov          = new();
      done_cov          = new();
      error_cov         = new();
      paused_cov        = new();
      current_state_cov = new();
      fifo_level_cov    = new();
    end
  endfunction

      //sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    busy_cov.sample();
    done_cov.sample();
    error_cov.sample();
    paused_cov.sample();
    current_state_cov.sample();
    fifo_level_cov.sample();

  endfunction

  virtual function void sample_values();
    super.sample_values();
    busy_cov.sample();
    done_cov.sample();
    error_cov.sample();
    paused_cov.sample();
    current_state_cov.sample();
    fifo_level_cov.sample();
  endfunction   


  function void build;
    busy = uvm_reg_field::type_id::create("busy");
    busy.configure(this, 1, 0, "RO", 0, 1'h0, 1, 0, 1);
    done = uvm_reg_field::type_id::create("done");
    done.configure(this, 1, 1, "RO", 0, 1'h0, 1, 0, 1);
    error = uvm_reg_field::type_id::create("error");
    error.configure(this, 1, 2, "RO", 0, 1'h0, 1, 0, 1);
    paused = uvm_reg_field::type_id::create("paused");
    paused.configure(this, 1, 3, "RO", 0, 1'h0, 1, 0, 1);
    current_state = uvm_reg_field::type_id::create("current_state");
    current_state.configure(this, 4, 4, "RO", 0, 4'h0, 1, 0, 1);
    fifo_level = uvm_reg_field::type_id::create("fifo_level");
    fifo_level.configure(this, 8, 8, "RO", 0, 8'h0, 1, 0, 1);
    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
  endfunction

endclass


  //transfer_count reg

class transfer_count_reg extends uvm_reg;
  `uvm_object_utils(transfer_count_reg)

  rand uvm_reg_field transfer_count;

  //covergroup
  covergroup transfer_count_cov;
    option.per_instance = 1;
    coverpoint transfer_count.value[31:0] {
      bins low     = {[32'd0 : 32'd15]};
      bins med    = {[32'd16 : 32'd255]};
      bins high     = {[32'd256 : 32'hFFFF_FFFF]};
    }
  endgroup

  function new(string name = "transfer_count_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);

    if (has_coverage(UVM_CVR_FIELD_VALS)) begin
      transfer_count_cov = new();
    end
  endfunction

  //sample
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    transfer_count_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
     transfer_count_cov.sample();
  endfunction

  function void build;
    transfer_count = uvm_reg_field::type_id::create("transfer_count");
    transfer_count.configure(this, 32, 0, "RO", 0, 32'h0, 1, 1, 1);
  endfunction

endclass


//descriptor_addr

class descriptor_addr_reg extends uvm_reg;
  `uvm_object_utils(descriptor_addr_reg)

  rand uvm_reg_field descriptor_addr;

  //covergroup
  covergroup descriptor_addr_cov;
    option.per_instance = 1;
    coverpoint descriptor_addr.value[31:0] {
      bins low     = {[32'h0000_0000 : 32'h0FFF_FFFF]};
      bins med  = {[32'h1000_0000 : 32'h7FFF_FFFF]};
      bins high    = {[32'h8000_0000 : 32'hFFFF_FFFF]};
    }
  endgroup

  function new(string name = "descriptor_addr_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);
    if (has_coverage(UVM_CVR_FIELD_VALS)) begin
      descriptor_addr_cov = new();
    end
  endfunction

//sample func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    descriptor_addr_cov.sample();
  endfunction

  virtual function void sample_values();
    super.sample_values();
     descriptor_addr_cov.sample();
  endfunction

  function void build;
    descriptor_addr = uvm_reg_field::type_id::create("descriptor_addr");
    descriptor_addr.configure(this, 32, 0, "RW", 0, 32'h0, 1, 1, 1);
  endfunction

endclass

//error_status_reg

class error_status_reg extends uvm_reg;
  `uvm_object_utils(error_status_reg)

  rand uvm_reg_field bus_error;
  rand uvm_reg_field timeout_error;
  rand uvm_reg_field alignment_error;
  rand uvm_reg_field overflow_error;
  rand uvm_reg_field underflow_error;
  uvm_reg_field reserved;
  rand uvm_reg_field error_code;
  rand uvm_reg_field error_addr_offset;


  //covergroup
  covergroup error_flag_cov;
    option.per_instance = 1;
    coverpoint bus_error.value[0]       { bins hit = {0,1}; }
    coverpoint timeout_error.value[1]   { bins hit = {0,1}; }
    coverpoint alignment_error.value[2]  { bins hit = {0,1}; }
    coverpoint overflow_error.value[3]   { bins hit = {0,1}; }
    coverpoint underflow_error.value[4]  { bins hit = {0,1}; }
  endgroup

  covergroup error_code_cov;
    option.per_instance = 1;
    coverpoint error_code.value[15:8] {
      bins all_codes = {[0:255]};
    }
  endgroup

  covergroup error_addr_cov;
    option.per_instance = 1;
    coverpoint error_addr_offset.value[31:16] {
      bins low    = {[16'h0000 : 16'h00FF]};
      bins mid    = {[16'h0100 : 16'h0FFF]};
      bins high   = {[16'h1000 : 16'hFFFF]};
    }
  endgroup


  function new(string name = "error_status_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);

    if (has_coverage(UVM_CVR_FIELD_VALS)) begin
      error_flag_cov = new();
      error_code_cov = new();
      error_addr_cov = new();
    end
  endfunction

  //smaple func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    error_flag_cov.sample();
    error_code_cov.sample();
    error_addr_cov.sample();
   
  endfunction

  virtual function void sample_values();
    super.sample_values();
   error_flag_cov.sample();
    error_code_cov.sample();
    error_addr_cov.sample();
  
  endfunction 

  function void build;
    bus_error = uvm_reg_field::type_id::create("bus_error");
    bus_error.configure(this, 1, 0, "W1C", 0, 1'h0, 1, 1, 1);
    timeout_error = uvm_reg_field::type_id::create("timeout_error");
    timeout_error.configure(this, 1, 1, "W1C", 0, 1'h0, 1, 1, 1);
    alignment_error = uvm_reg_field::type_id::create("alignment_error");
    alignment_error.configure(this, 1, 2, "W1C", 0, 1'h0, 1, 1, 1);
    overflow_error = uvm_reg_field::type_id::create("overflow_error");
    overflow_error.configure(this, 1, 3, "W1C", 0, 1'h0, 1, 1, 1);
    underflow_error = uvm_reg_field::type_id::create("underflow_error");
    underflow_error.configure(this, 1, 4, "W1C", 0, 1'h0, 1, 1, 1);
    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 3, 5, "RO", 0, 3'h0, 1, 0, 1);
    error_code = uvm_reg_field::type_id::create("error_code");
    error_code.configure(this, 8, 8, "RO", 0, 8'h0, 1, 0, 1);
    error_addr_offset = uvm_reg_field::type_id::create("error_addr_offset");
    error_addr_offset.configure(this, 16, 16, "RO", 0, 16'h0, 1, 0, 1);
  endfunction

endclass


//config reg
class config_reg extends uvm_reg;
  `uvm_object_utils(config_reg)

  rand uvm_reg_field priority1;
  rand uvm_reg_field auto_restart;
  rand uvm_reg_field interrupt_enable;
  rand uvm_reg_field burst_size;
  rand uvm_reg_field data_width;
  rand uvm_reg_field descriptor_mode;
  uvm_reg_field reserved;

  //covergroup
  covergroup priority_cov;
    option.per_instance = 1;
    coverpoint priority1.value[1:0] {
      bins all_prio = {0,1,2,3};
    }
  endgroup

  covergroup auto_restart_cov;
    option.per_instance = 1;
    coverpoint auto_restart.value[2] {
      bins autostart = {0, 1};
    }
  endgroup

  covergroup interrupt_enable_cov;
    option.per_instance = 1;
    coverpoint interrupt_enable.value[3] {
      bins interrupt = {0, 1};
    }
  endgroup

  covergroup burst_size_cov;
    option.per_instance = 1;
    coverpoint burst_size.value[5:4] {
      bins burst   = {0, 1, 2, 3};
    }
  endgroup

  covergroup data_width_cov;
    option.per_instance = 1;
    coverpoint data_width.value[7:6] {
      bins width  = {0,1,2,3};
    }
  endgroup

  covergroup descriptor_mode_cov;
    option.per_instance = 1;
    coverpoint descriptor_mode.value[8] {
      bins discriptor = {0,1};
    }
  endgroup

 

  function new(string name = "config_reg");
    super.new(name, 32, UVM_CVR_FIELD_VALS);

    if (has_coverage(UVM_CVR_FIELD_VALS)) begin
      priority_cov         = new();
      auto_restart_cov     = new();
      interrupt_enable_cov = new();
      burst_size_cov       = new();
      data_width_cov       = new();
      descriptor_mode_cov  = new();
  
    end
  endfunction


  //smaple func
  virtual function void sample(
    uvm_reg_data_t data,
    uvm_reg_data_t byte_en,
    bit is_read,
    uvm_reg_map map
  );
    priority_cov .sample();
    auto_restart_cov.sample();
    interrupt_enable_cov.sample();
    burst_size_cov.sample();
    data_width_cov.sample();
    descriptor_mode_cov.sample();
   
  endfunction

  virtual function void sample_values();
    super.sample_values();
   priority_cov .sample();
    auto_restart_cov.sample();
    interrupt_enable_cov.sample();
    burst_size_cov.sample();
    data_width_cov.sample();
    descriptor_mode_cov.sample();

  endfunction

  function void build;
    priority1 = uvm_reg_field::type_id::create("priority1");
    priority1.configure(this, 2, 0, "RW", 0, 2'h0, 1, 1, 1);
    auto_restart = uvm_reg_field::type_id::create("auto_restart");
    auto_restart.configure(this, 1, 2, "RW", 0, 1'h0, 1, 1, 1);
    interrupt_enable = uvm_reg_field::type_id::create("interrupt_enable");
    interrupt_enable.configure(this, 1, 3, "RW", 0, 1'h0, 1, 1, 1);
    burst_size = uvm_reg_field::type_id::create("burst_size");
    burst_size.configure(this, 2, 4, "RW", 0, 2'h0, 1, 1, 1);
    data_width = uvm_reg_field::type_id::create("data_width");
    data_width.configure(this, 2, 6, "RW", 0, 2'h0, 1, 1, 1);
    descriptor_mode = uvm_reg_field::type_id::create("descriptor_mode");
    descriptor_mode.configure(this, 1, 8, "RW", 0, 1'h0, 1, 1, 1);
    reserved = uvm_reg_field::type_id::create("reserved");
    reserved.configure(this, 23, 9, "RO", 0, 23'h0, 1, 0, 1);
  endfunction

endclass






 
