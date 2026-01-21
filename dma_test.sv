
class dma_test extends uvm_test;
  `uvm_component_utils(dma_test)
  
  dma_env dma_e;
  dma_base_reg_seq dma_reg_seq;
  
  function new(string name = "dma_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    dma_reg_seq = dma_base_reg_seq::type_id::create("dma_reg_seq");
    dma_reg_seq.dma_regmodel = dma_e.dma_regmodel;
    dma_reg_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass

//reset test
class dma_rst_check_test extends uvm_test;
  `uvm_component_utils(dma_rst_check_test)
  
  dma_env dma_e;
  rst_check_seq rst_seq;
  
  function new(string name = "dma_rst_check_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    rst_seq = rst_check_seq::type_id::create("rst_seq");
    rst_seq.dma_regmodel = dma_e.dma_regmodel;
    rst_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass

// //interrupt test
// class dma_intr_test extends uvm_test;
//   `uvm_component_utils(dma_intr_test)
  
//   dma_env dma_e;
//   intr_reg_seq intr_seq;
  
//   function new(string name = "dma_intr_test", uvm_component parent);
//     super.new(name, parent);
//   endfunction
  
//   function void build_phase(uvm_phase phase);
//     super.build_phase(phase);
//     dma_e = dma_env::type_id::create("dma_e", this);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     intr_seq = intr_reg_seq::type_id::create("intr_seq");
//     intr_seq.dma_regmodel = dma_e.dma_regmodel;
//     intr_seq.start(dma_e.dma_agt.seqr);
//     phase.drop_objection(this);
//   endtask
  
// endclass

// // //comtrol reg test
class dma_ctrl_test extends uvm_test;
  `uvm_component_utils(dma_ctrl_test)
  
  dma_env dma_e;
  ctrl_reg_seq ctrl_seq;
  
  function new(string name = "dma_ctrl_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    ctrl_seq = ctrl_reg_seq::type_id::create("ctrl_seq");
    ctrl_seq.dma_regmodel = dma_e.dma_regmodel;
    ctrl_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass

//io addr reg test
class dma_io_addr_test extends uvm_test;
  `uvm_component_utils(dma_io_addr_test)
  
  dma_env dma_e;
  io_addr_reg_seq io_addr_seq;
  
  function new(string name = "dma_io_addr_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    io_addr_seq = io_addr_reg_seq::type_id::create("io_addr_seq");
    io_addr_seq.dma_regmodel = dma_e.dma_regmodel;
    io_addr_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass


//Memory Address Register Test
class dma_mem_addr_test extends uvm_test;
  `uvm_component_utils(dma_mem_addr_test)
  
  dma_env dma_e;
  mem_addr_reg_seq mem_addr_seq;
  
  function new(string name = "dma_mem_addr_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    mem_addr_seq = mem_addr_reg_seq::type_id::create("mem_addr_seq");
    mem_addr_seq.dma_regmodel = dma_e.dma_regmodel;
    mem_addr_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass


// Extra Info Register Test
class dma_extra_info_test extends uvm_test;
  `uvm_component_utils(dma_extra_info_test)
  
  dma_env dma_e;
  extra_info_reg_seq extra_info_seq;
  
  function new(string name = "dma_extra_info_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    extra_info_seq = extra_info_reg_seq::type_id::create("extra_info_seq");
    extra_info_seq.dma_regmodel = dma_e.dma_regmodel;
    extra_info_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass


// // // Status Register Test
// // class dma_status_test extends uvm_test;
// //   `uvm_component_utils(dma_status_test)
  
// //   dma_env dma_e;
// //   status_reg_seq status_seq;
  
// //   function new(string name = "dma_status_test", uvm_component parent);
// //     super.new(name, parent);
// //   endfunction
  
// //   function void build_phase(uvm_phase phase);
// //     super.build_phase(phase);
// //     dma_e = dma_env::type_id::create("dma_e", this);
// //   endfunction
  
// //   task run_phase(uvm_phase phase);
// //     phase.raise_objection(this);
// //     status_seq = status_reg_seq::type_id::create("status_seq");
// //     status_seq.dma_regmodel = dma_e.dma_regmodel;
// //     status_seq.start(dma_e.dma_agt.seqr);
// //     phase.drop_objection(this);
// //   endtask
  
// // endclass


// // // Transfer Count Register Test
// // class dma_transfer_count_test extends uvm_test;
// //   `uvm_component_utils(dma_transfer_count_test)
  
// //   dma_env dma_e;
// //   transfer_count_reg_seq transfer_count_seq;
  
// //   function new(string name = "dma_transfer_count_test", uvm_component parent);
// //     super.new(name, parent);
// //   endfunction
  
// //   function void build_phase(uvm_phase phase);
// //     super.build_phase(phase);
// //     dma_e = dma_env::type_id::create("dma_e", this);
// //   endfunction
  
// //   task run_phase(uvm_phase phase);
// //     phase.raise_objection(this);
// //     transfer_count_seq = transfer_count_reg_seq::type_id::create("transfer_count_seq");
// //     transfer_count_seq.dma_regmodel = dma_e.dma_regmodel;
// //     transfer_count_seq.start(dma_e.dma_agt.seqr);
// //     phase.drop_objection(this);
// //   endtask
  
// // endclass


// Descriptor Address Register Test
class dma_descriptor_addr_test extends uvm_test;
  `uvm_component_utils(dma_descriptor_addr_test)
  
  dma_env dma_e;
  descriptor_addr_reg_seq descriptor_addr_seq;
  
  function new(string name = "dma_descriptor_addr_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    descriptor_addr_seq = descriptor_addr_reg_seq::type_id::create("descriptor_addr_seq");
    descriptor_addr_seq.dma_regmodel = dma_e.dma_regmodel;
    descriptor_addr_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass


// Error Status Register Test
class dma_error_status_test extends uvm_test;
  `uvm_component_utils(dma_error_status_test)
  
  dma_env dma_e;
  error_status_reg_seq error_status_seq;
  
  function new(string name = "dma_error_status_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    error_status_seq = error_status_reg_seq::type_id::create("error_status_seq");
    error_status_seq.dma_regmodel = dma_e.dma_regmodel;
    error_status_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass

// Config Register Test
class dma_config_test extends uvm_test;
  `uvm_component_utils(dma_config_test)
  
  dma_env dma_e;
  config_reg_seq config_seq;
  
  function new(string name = "dma_config_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    config_seq = config_reg_seq::type_id::create("config_seq");
    config_seq.dma_regmodel = dma_e.dma_regmodel;
    config_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass

//Regression Test (All Sequences)
class dma_regression_test extends uvm_test;
  `uvm_component_utils(dma_regression_test)
  
  dma_env dma_e;
  dma_regression_seq regression_seq;
  
  function new(string name = "dma_regression_test", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    dma_e = dma_env::type_id::create("dma_e", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    regression_seq = dma_regression_seq::type_id::create("regression_seq");
    regression_seq.dma_regmodel = dma_e.dma_regmodel;
    regression_seq.start(dma_e.dma_agt.seqr);
    phase.drop_objection(this);
  endtask
  
endclass
  



