package dma_pkg;
	`include "uvm_macros.svh"
	import uvm_pkg::*;
	`include "dma_defines.sv"
	`include "dma_sequence_item.sv"
	`include "dma_reg_class.sv"
    `include "dma_topreg_block.sv"
	`include "dma_adapter.sv"
	`include "dma_reg_sequence.sv"
	//`include "dma_sequencer.sv"
	`include "dma_driver.sv"
	`include "dma_monitor.sv"
	//`include "apb_passive_monitor.sv"
	//`include "apb_subscriber.sv"
	`include "dma_scoreboard.sv"
	`include "dma_agent.sv"
	`include "dma_env.sv"
	`include "dma_test.sv"
	
endpackage
