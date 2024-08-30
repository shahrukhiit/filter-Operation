`timescale  1 ps / 1 ps
module wrapper
  #(
    parameter DATA_WIDTH     = 32,
    parameter FILTID_WIDTH   = 8,
    parameter L2_AWIDTH_NOAL = 15,
    parameter TRANS_SIZE     = 16
    )
   (
    input  logic                             clk_i,
    input  logic                             resetn_i,

    input  logic                      [31:0] cfg_data_i,
    input  logic                       [4:0] cfg_addr_i,
    input  logic                             cfg_valid_i,
    input  logic                             cfg_rwn_i,
    output logic                      [31:0] cfg_data_o,
    output logic                             cfg_ready_o,

    output logic                             eot_event_o,
    output logic                             act_event_o,

    output logic                             filter_tx_ch0_req_o,
    output logic        [L2_AWIDTH_NOAL-1:0] filter_tx_ch0_addr_o,
    output logic                       [1:0] filter_tx_ch0_datasize_o,
    input  logic                             filter_tx_ch0_gnt_i,

    input  logic                             filter_tx_ch0_valid_i,
    input  logic            [DATA_WIDTH-1:0] filter_tx_ch0_data_i,
    output logic                             filter_tx_ch0_ready_o,

    output logic                             filter_tx_ch1_req_o,
    output logic        [L2_AWIDTH_NOAL-1:0] filter_tx_ch1_addr_o,
    output logic                       [1:0] filter_tx_ch1_datasize_o,
    input  logic                             filter_tx_ch1_gnt_i,

    input  logic                             filter_tx_ch1_valid_i,
    input  logic            [DATA_WIDTH-1:0] filter_tx_ch1_data_i,
    output logic                             filter_tx_ch1_ready_o,

    output logic        [L2_AWIDTH_NOAL-1:0] filter_rx_ch_addr_o,
    output logic                       [1:0] filter_rx_ch_datasize_o,
    output logic                             filter_rx_ch_valid_o,
    output logic            [DATA_WIDTH-1:0] filter_rx_ch_data_o,
    input  logic                             filter_rx_ch_ready_i,

    input  logic          [FILTID_WIDTH-1:0] filter_id_i,
    input  logic            [DATA_WIDTH-1:0] filter_data_i,
    input  logic                       [1:0] filter_datasize_i,
    input  logic                             filter_valid_i,
    input  logic                             filter_sof_i,
    input  logic                             filter_eof_i,
    output logic                             filter_ready_o
    ); 
 
logic   we;         
logic  [14:0] write_addr;    
logic  [31:0] write_data;    
logic  [14:0]  read_addr_a;   
logic  [14:0]  read_addr_b;   
logic  [31:0] read_data_a;   
logic  [31:0] read_data_b;
 
 udma_filter #()
  dut_filter(clk_i,
 resetn_i,

 cfg_data_i,
 cfg_addr_i,
 cfg_valid_i,
 cfg_rwn_i,
 cfg_data_o,
 cfg_ready_o, 

 eot_event_o,
 act_event_o,

 filter_tx_ch0_req_o,
 //filter_tx_ch0_addr_o, 
 read_addr_a,
 filter_tx_ch0_datasize_o,
 filter_tx_ch0_gnt_i,

 filter_tx_ch0_valid_i,
 //filter_tx_ch0_data_i, 
 read_data_a,
 filter_tx_ch0_ready_o,

 filter_tx_ch1_req_o,
 //filter_tx_ch1_addr_o, 
 read_addr_b,
 filter_tx_ch1_datasize_o,
 filter_tx_ch1_gnt_i,

 filter_tx_ch1_valid_i,
 //filter_tx_ch1_data_i, 
 read_data_b,
 filter_tx_ch1_ready_o,

 write_addr,//filter_rx_ch_addr_o,
 filter_rx_ch_datasize_o,
 we,//filter_rx_ch_valid_o, //
 write_data,//filter_rx_ch_data_o,
 filter_rx_ch_ready_i,

 filter_id_i,
 filter_data_i,
 filter_datasize_i,
 filter_valid_i,
 filter_sof_i,
 filter_eof_i,
 filter_ready_o);
 
 dual_read_mem buffer(
     clk_i,           
	 resetn_i,
     we,          
     write_addr,    
     write_data,    
     read_addr_a,   
     read_addr_b,   
     read_data_a,   
     read_data_b    
);
assign filter_rx_ch_valid_o=we;
assign filter_rx_ch_addr_o=write_addr;
assign filter_rx_ch_data_o=write_data;
 
 endmodule