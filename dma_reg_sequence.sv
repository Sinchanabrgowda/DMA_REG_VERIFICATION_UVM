class dma_base_reg_seq extends uvm_sequence;
  `uvm_object_utils(dma_base_reg_seq)

top_dma_reg_block dma_regmodel;

  function new (string name = "dma_base_reg_seq"); 
    super.new(name);
  endfunction
  
  uvm_status_e status;
  uvm_reg_data_t    rdata, rdata_m, dout_t;

endclass


//reset sequence
 class rst_check_seq extends dma_base_reg_seq;
  `uvm_object_utils(rst_check_seq)
  
  function new (string name = "rst_check_seq"); 
    super.new(name);
  endfunction

  task body;
    bit [31:0] rst_reg;
    
   
    //  intr_reg_inst
    $display("\n============== intr_reg_inst reset check==============");
    
    rst_reg = dma_regmodel.intr_reg_inst.get_reset();
    `uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h ", rst_reg), UVM_NONE);
    
    dma_regmodel.intr_reg_inst.read(status, rdata);
    `uvm_info("SEQ", $sformatf(" Read from DUT : 0x%0h ", rdata), UVM_NONE);
    
    if (rdata == rst_reg)
  `uvm_info(get_type_name(), "INTR register reset verified", UVM_NONE)
    else
  `uvm_error(get_type_name(), "INTR register reset failed")
  
  
// ctrl_reg
    $display("\n============== ctrl_reg_inst reset check ==============");

rst_reg = dma_regmodel.ctrl_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.ctrl_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "CTRL register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "CTRL register reset FAILED");


//io_addr reg
    $display("\n============== io_addr_reg_inst reset check ==============");

rst_reg = dma_regmodel.io_addr_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.io_addr_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "IO_ADDR register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "IO_ADDR register reset FAILED");

    
    
//mem_addr reg
    $display("\n============== mem_addr_reg_inst reset check ==============");

rst_reg = dma_regmodel.mem_addr_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.mem_addr_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "MEM_ADDR register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "MEM_ADDR register reset FAILED");

    
//extra_info reg
    $display("\n============== extra_info_reg_inst reset check ==============");

rst_reg = dma_regmodel.extra_info_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.extra_info_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "EXTRA_INFO register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "EXTRA_INFO register reset FAILED");

    
//status reg
    $display("\n============== status_reg_inst reset check ==============");

rst_reg = dma_regmodel.status_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.status_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "STATUS register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "STATUS register reset FAILED");

    
//transfer_count
    $display("\n============== transfer_count_reg_inst reset check ==============");

rst_reg = dma_regmodel.transfer_count_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.transfer_count_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "TRANSFER_COUNT register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "TRANSFER_COUNT register reset FAILED");

    
//descriptor_addr reg
    $display("\n============== descriptor_addr_reg_inst reset check ==============");

rst_reg = dma_regmodel.descriptor_addr_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.descriptor_addr_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "DESCRIPTOR_ADDR register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "DESCRIPTOR_ADDR register reset FAILED");

    
//error_state reg
    $display("\n============== error_status_reg_inst reset check ==============");

rst_reg = dma_regmodel.error_status_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.error_status_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "ERROR_STATUS register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "ERROR_STATUS register reset FAILED");

    
//config reg
    $display("\n============== config_reg_inst reset check ==============");

rst_reg = dma_regmodel.config_reg_inst.get_reset();
`uvm_info("SEQ", $sformatf("Register Reset Value : 0x%0h", rst_reg), UVM_NONE);

dma_regmodel.config_reg_inst.read(status, rdata);
`uvm_info("SEQ", $sformatf("Read from DUT : 0x%0h", rdata), UVM_NONE);

if (rdata == rst_reg)
  `uvm_info(get_type_name(), "CONFIG register reset verified", UVM_NONE)
else
  `uvm_error(get_type_name(), "CONFIG register reset FAILED");


  endtask
endclass



//intr_reg seq
class intr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(intr_reg_seq)

  function new(string name = "intr_reg_seq");
    super.new(name);
  endfunction

  task body();
    uvm_status_e   status;
    uvm_reg_data_t bd_value;
    uvm_reg_data_t before_value, after_value;

    $display("\n========== INTR Register seq check ==========");
   
    bd_value = $urandom();
    

    // Read before write
    dma_regmodel.intr_reg_inst.read(status, before_value, UVM_BACKDOOR);
    `uvm_info("INTR_SEQ",
      $sformatf("Before write value = 0x%0h", before_value), UVM_LOW)

    // Frontdoor write
    dma_regmodel.intr_reg_inst.write(status, bd_value, UVM_FRONTDOOR);
    `uvm_info("INTR_SEQ",
      $sformatf("Frontdoor write value = 0x%0h", bd_value), UVM_LOW)

    // Read after write
    dma_regmodel.intr_reg_inst.read(status, after_value, UVM_BACKDOOR);
    `uvm_info("INTR_SEQ",
      $sformatf("After write value = 0x%0h", after_value), UVM_LOW)

    // RO field check [15:0]
    if (after_value[15:0] != before_value[15:0])
      `uvm_error("INTR_SEQ", $sformatf("RO intr_status changed! before=0x%0h after=0x%0h", before_value[15:0], after_value[15:0]))
      else
        `uvm_info("INTR_SEQ",$sformatf("RO intr_status unchanged: before=0x%0h after=0x%0h",before_value[15:0], after_value[15:0]),UVM_LOW)

    // RW field check [31:16]
    if (after_value[31:16] != bd_value[31:16])
      `uvm_error("INTR_SEQ",$sformatf("RW intr_mask not updated! exp=0x%0h got=0x%0h", bd_value[31:16], after_value[31:16]))
      `uvm_info("INTR_SEQ", "INTR register verified", UVM_LOW)
 
  endtask
endclass



// //ctrl_reg_seq

class ctrl_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(ctrl_reg_seq)
  
  function new (string name = "ctrl_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    uvm_reg_data_t wdata;

//    wdata[0]     = 1'b1;     // start_dma
  //  wdata[15:1]  = $urandom();   // w_count
   // wdata[16]    = 1'b1;     // io_mem

     wdata = $urandom();
     
    $display("\n============== ctrl reg seq check ==============");
    dma_regmodel.ctrl_reg_inst.write(status, wdata, UVM_FRONTDOOR);
    `uvm_info("CTRL_SEQ", $sformatf( "WRITE CTRL: start_dma=%0b w_count=%0d io_mem=%0b (wdata=0x%0h)", wdata[0], wdata[15:1], wdata[16], wdata ), UVM_LOW)

    rdata   = dma_regmodel.ctrl_reg_inst.get();
    rdata_m = dma_regmodel.ctrl_reg_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);

    dma_regmodel.ctrl_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
    `uvm_info("CTRL_SEQ",$sformatf( "READ  CTRL: start_dma=%0b w_count=%0d io_mem=%0b (rdata=0x%0h)",dout_t[0], dout_t[15:1], dout_t[16], dout_t ), UVM_LOW)
    rdata   = dma_regmodel.ctrl_reg_inst.get();
    rdata_m = dma_regmodel.ctrl_reg_inst.get_mirrored_value();

    `uvm_info("CTRL_SEQ",$sformatf("read -> Des:%0h Mir:%0h ",rdata, rdata_m),UVM_LOW)

     dma_regmodel.ctrl_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
    `uvm_info("CTRL_SEQ",$sformatf( "READ 2nd cycle CTRL: start_dma=%0b w_count=%0d io_mem=%0b (rdata=0x%0h)",dout_t[0], dout_t[15:1], dout_t[16], dout_t ), UVM_LOW)
    rdata   = dma_regmodel.ctrl_reg_inst.get();
    rdata_m = dma_regmodel.ctrl_reg_inst.get_mirrored_value();

    `uvm_info("CTRL_SEQ",$sformatf("read 2nd cycle -> Des:%0h Mir:%0h ",rdata, rdata_m),UVM_LOW)
    
    if (dout_t[0] != 0)  
      `uvm_error("CTRL_SEQ", "start_dma did not self-clear")

  endtask
endclass

//io_addr reg
class io_addr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(io_addr_reg_seq)
  
  function new (string name = "io_addr_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    uvm_reg_data_t wdata;
   // repeat(`no_of_transactions) begin
    wdata = $urandom();
    
    $display("\n============== io_addr reg seq check ==============");
    dma_regmodel.io_addr_reg_inst.write(status, wdata, UVM_FRONTDOOR);

   
    rdata   = dma_regmodel.io_addr_reg_inst.get();
    rdata_m = dma_regmodel.io_addr_reg_inst.get_mirrored_value();
     `uvm_info("SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);

    dma_regmodel.io_addr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
   //  dma_regmodel.io_addr_reg_inst.mirror(status, UVM_CHECK);
     rdata   = dma_regmodel.io_addr_reg_inst.get();
    rdata_m = dma_regmodel.io_addr_reg_inst.get_mirrored_value();
    `uvm_info("IO_ADDR_SEQ",$sformatf("read  -> Des:%0h Mir:%0h ",rdata, rdata_m),UVM_LOW)

  endtask
endclass


//mem_Addr_reg_seq
class mem_addr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(mem_addr_reg_seq)
  
  function new (string name = "mem_addr_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    
    uvm_reg_data_t wdata;
    wdata = $urandom();

    $display("\n============== mem_addr reg seq check ==============");
    dma_regmodel.mem_addr_reg_inst.write(status, wdata, UVM_FRONTDOOR);

    rdata   = dma_regmodel.mem_addr_reg_inst.get();
    rdata_m = dma_regmodel.mem_addr_reg_inst.get_mirrored_value();
    `uvm_info("mem SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);

    
    dma_regmodel.mem_addr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
    rdata   = dma_regmodel.mem_addr_reg_inst.get();
    rdata_m = dma_regmodel.mem_addr_reg_inst.get_mirrored_value();
    `uvm_info("mem SEQ", $sformatf("read -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);

  endtask
endclass


//extra_info_reg_seq
class extra_info_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(extra_info_reg_seq)
  
  function new (string name = "extra_info_reg_seq"); 
    super.new(name);
  endfunction

  task body();
 uvm_reg_data_t wdata;
    wdata = $urandom();
    
    $display("\n============== extra_info reg seq check ==============");
    dma_regmodel.extra_info_reg_inst.write(status, wdata, UVM_FRONTDOOR);

    rdata   = dma_regmodel.extra_info_reg_inst.get();
    rdata_m = dma_regmodel.extra_info_reg_inst.get_mirrored_value();
 `uvm_info("SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);
    
    dma_regmodel.extra_info_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
    rdata   = dma_regmodel.extra_info_reg_inst.get();
    rdata_m = dma_regmodel.extra_info_reg_inst.get_mirrored_value();
   `uvm_info("IO_ADDR_SEQ",$sformatf("read  -> Des:%0h Mir:%0h ",rdata, rdata_m),UVM_LOW)

  endtask
endclass


  //status_reg_seq
class status_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(status_reg_seq)
  
  function new (string name = "status_reg_seq"); 
    super.new(name);
  endfunction

  task body();
    uvm_reg_data_t    bd_value;  // value to backdoor write

   
   $display("\n========== status Register seq check ==========");

    //bd_value = 32'hA5A5_5A5A;
      bd_value = $urandom();    


    `uvm_info("STATUS_SEQ", $sformatf("Frontdoor write value: 0x%0h", bd_value), UVM_LOW)
    dma_regmodel.status_reg_inst.write(status, bd_value, UVM_FRONTDOOR);

    dma_regmodel.status_reg_inst.read(status, dout_t, UVM_BACKDOOR);
    `uvm_info("STATUS_SEQ", $sformatf("Backdoor read value = 0x%0h", dout_t), UVM_LOW)

    if (bd_value == dout_t)
      `uvm_error("STATUS_SEQ", $sformatf("Mismatch: dout_t=0x%0h MIRROR=0x%0h", dout_t, bd_value))
    else
      `uvm_info("STATUS_SEQ", " no write happend to RO status register verified", UVM_NONE)
  endtask
endclass


//transfer_count_reg_seq
class transfer_count_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(transfer_count_reg_seq)
  
  function new (string name = "transfer_count_reg_seq"); 
    super.new(name);
  endfunction

  task body();

  uvm_reg_data_t bd_value;
//  bd value = 32'hA5A5_5A5A; //backdoor write
  bd_value = $urandom();
  $display("\n========== TRANSFER COUNT RO Register check ==========");
    `uvm_info("TRANSFER_SEQ", $sformatf("Frontdoor write value: 0x%0h", bd_value), UVM_LOW)
    dma_regmodel.transfer_count_reg_inst.write(status, bd_value, UVM_FRONTDOOR);

    dma_regmodel.transfer_count_reg_inst.read(status, dout_t, UVM_BACKDOOR);
    `uvm_info("TRANSFER_SEQ", $sformatf("Backdoor read value = 0x%0h", dout_t), UVM_LOW)

    if (bd_value == dout_t)
      `uvm_error("TRANSFER_SEQ", $sformatf("Mismatch: dout_t=0x%0h MIRROR=0x%0h", dout_t, bd_value))
    else
      `uvm_info("TRANSFER_SEQ", "no write happened transfer register verified", UVM_NONE)

endtask

endclass


//descriptor_reg_seq
class descriptor_addr_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(descriptor_addr_reg_seq)
  
  function new (string name = "descriptor_reg_seq"); 
    super.new(name);
  endfunction

  task body();
   uvm_reg_data_t wdata;
    wdata = $urandom();

$display("\n============== DESCRIPTOR_addr reg seq check ==============");
    dma_regmodel.descriptor_addr_reg_inst.write(status, wdata, UVM_FRONTDOOR);

    rdata   = dma_regmodel.descriptor_addr_reg_inst.get();
    rdata_m = dma_regmodel.descriptor_addr_reg_inst.get_mirrored_value();
    `uvm_info("mem SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);   

    dma_regmodel.descriptor_addr_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
rdata   = dma_regmodel.descriptor_addr_reg_inst.get();
    rdata_m = dma_regmodel.descriptor_addr_reg_inst.get_mirrored_value();
    `uvm_info("mem SEQ", $sformatf("read -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);

  endtask
endclass



// //error_status_reg_seq
class error_status_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(error_status_reg_seq)
  
  function new (string name = "error_status_reg_seq"); 
    super.new(name);
  endfunction

  task body();
     uvm_reg_data_t wdata;
    wdata = $urandom();

    $display("\n============== error_status reg seq check ==============");
    dma_regmodel.error_status_reg_inst.write(status, wdata, UVM_FRONTDOOR);

    rdata   = dma_regmodel.error_status_reg_inst.get();
    rdata_m = dma_regmodel.error_status_reg_inst.get_mirrored_value();
     `uvm_info("SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);
    
    
    dma_regmodel.error_status_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
    `uvm_info("ERROR_SEQ",$sformatf("read  -> Des:%0h Mir:%0h ",rdata, rdata_m),UVM_LOW)
    
    if (rdata != 0 ) 
      `uvm_error(get_type_name(), "error_status didnt clear to zero") 
      else
       `uvm_info(get_type_name(),"ERROR_STATUS register verified\n",UVM_NONE)

  endtask
endclass

//config_reg
class config_reg_seq extends dma_base_reg_seq;
  `uvm_object_utils(config_reg_seq)
  
  function new (string name = "config_reg_seq"); 
    super.new(name);
  endfunction

  task body();
	uvm_reg_data_t wdata;
     wdata[8:0] = $urandom();

    $display("\n============== cOnfig reg seq check ==============");
    dma_regmodel.config_reg_inst.write(status, wdata, UVM_FRONTDOOR);

    rdata   = dma_regmodel.config_reg_inst.get();
    rdata_m = dma_regmodel.config_reg_inst.get_mirrored_value();
    `uvm_info("SEQ", $sformatf("Write -> Des: %0h Mir: %0h", rdata, rdata_m), UVM_NONE);

    dma_regmodel.config_reg_inst.read(status, dout_t, UVM_FRONTDOOR);
     rdata   = dma_regmodel.config_reg_inst.get();
    rdata_m = dma_regmodel.config_reg_inst.get_mirrored_value();
    `uvm_info("CONFIG_SEQ",$sformatf("read  -> Des:%0h Mir:%0h ", rdata, rdata_m),UVM_LOW)

    if (dout_t[31:9] != 0)
      `uvm_error("CONFIG_SEQ", "Reserved bits modified")

  endtask
endclass

 //regression seq 
 class dma_regression_seq extends dma_base_reg_seq;
  `uvm_object_utils(dma_regression_seq)
  
  rst_check_seq rst_seq;
  intr_reg_seq intr_seq;
  ctrl_reg_seq ctrl_seq;
  io_addr_reg_seq io_addr_seq;
  mem_addr_reg_seq mem_addr_seq;
  extra_info_reg_seq extra_info_seq;
  status_reg_seq status_seq;
  transfer_count_reg_seq transfer_count_seq;
  descriptor_addr_reg_seq descriptor_addr_seq;
  error_status_reg_seq error_status_seq;
  config_reg_seq config_seq;
  
  function new(string name = "dma_regression_seq");
    super.new(name);
  endfunction
  
  virtual task body();
    
    `uvm_create(rst_seq)
    rst_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(rst_seq)
    
    repeat(`no_of_transactions) begin
    `uvm_create(intr_seq)
    intr_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(intr_seq)
    
    `uvm_create(ctrl_seq)
    ctrl_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(ctrl_seq)
    
    `uvm_create(io_addr_seq)
    io_addr_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(io_addr_seq)
    
    `uvm_create(mem_addr_seq)
    mem_addr_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(mem_addr_seq)
    
    `uvm_create(extra_info_seq)
    extra_info_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(extra_info_seq)
    
    `uvm_create(status_seq)
    status_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(status_seq)
    
    `uvm_create(transfer_count_seq)
    transfer_count_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(transfer_count_seq)
    
    `uvm_create(descriptor_addr_seq)
    descriptor_addr_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(descriptor_addr_seq)
    
    `uvm_create(error_status_seq)
    error_status_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(error_status_seq)
    
    `uvm_create(config_seq)
    config_seq.dma_regmodel = this.dma_regmodel;
    `uvm_send(config_seq)
    end
  endtask
  
endclass
