`timescale  1 ps / 1 ps
module filter_tb;
    parameter DATA_WIDTH     = 32;
    parameter FILTID_WIDTH   = 8;
    parameter L2_AWIDTH_NOAL = 15;
    parameter TRANS_SIZE     = 16;

      logic                             clk_i;
      logic                             resetn_i;

      logic                      [31:0] cfg_data_i;
      logic                       [4:0] cfg_addr_i;
      logic                             cfg_valid_i;
      logic                             cfg_rwn_i;
      logic                      [31:0] cfg_data_o;
      logic                             cfg_ready_o;

      logic                             eot_event_o;
      logic                             act_event_o;

      logic                             filter_tx_ch0_req_o;
      logic        [L2_AWIDTH_NOAL-1:0] filter_tx_ch0_addr_o;
      logic                       [1:0] filter_tx_ch0_datasize_o;
      logic                             filter_tx_ch0_gnt_i;

      logic                             filter_tx_ch0_valid_i;
      logic            [DATA_WIDTH-1:0] filter_tx_ch0_data_i;
      logic                             filter_tx_ch0_ready_o;

      logic                             filter_tx_ch1_req_o;
      logic        [L2_AWIDTH_NOAL-1:0] filter_tx_ch1_addr_o;
      logic                       [1:0] filter_tx_ch1_datasize_o;
      logic                             filter_tx_ch1_gnt_i;

      logic                             filter_tx_ch1_valid_i;
      logic            [DATA_WIDTH-1:0] filter_tx_ch1_data_i;
      logic                             filter_tx_ch1_ready_o;

      logic        [L2_AWIDTH_NOAL-1:0] filter_rx_ch_addr_o;
      logic                       [1:0] filter_rx_ch_datasize_o;
      logic                             filter_rx_ch_valid_o;
      logic            [DATA_WIDTH-1:0] filter_rx_ch_data_o;
      logic                             filter_rx_ch_ready_i;

      logic          [FILTID_WIDTH-1:0] filter_id_i;
      logic            [DATA_WIDTH-1:0] filter_data_i;
      logic                       [1:0] filter_datasize_i;
      logic                             filter_valid_i;
      logic                             filter_sof_i;
      logic                             filter_eof_i;
      logic                             filter_ready_o;
  
  always #10 clk_i=~clk_i;
  
  initial begin
    clk_i=0;
    resetn_i=0;
    @(posedge clk_i);
    @(posedge clk_i);
    resetn_i=1;
  end

  initial begin 
/*cfg_data_i<='h0;
cfg_addr_i<='h0;
cfg_valid_i<='h0;
cfg_rwn_i<='h0; */

filter_tx_ch0_gnt_i<='h0;
filter_tx_ch0_valid_i<='h0;
filter_tx_ch0_data_i<='h0;

filter_tx_ch1_gnt_i<='h0;
filter_tx_ch1_valid_i<='h0;
filter_tx_ch1_data_i<='h0;

filter_rx_ch_ready_i<='h0;

filter_id_i<='h0;
filter_data_i<='h0;
filter_datasize_i<='h0;
filter_valid_i<='h0;
filter_sof_i<='h0;
filter_eof_i<='h0; 
cfg_rwn_i<=1'b0; //s_wr_addrs// writing on register
cfg_valid_i<=1'b1;
@(posedge clk_i);
cfg_addr_i<=5'b00000; //REG_TX_CH0_ADD
cfg_data_i<=32'd200;// address

@(posedge clk_i);
cfg_addr_i<=5'b00101; //REG_TX_CH1_ADD
cfg_data_i<=32'd300;// address

@(posedge clk_i);
cfg_addr_i<=5'b01010; //REG_RX_CH_ADD
cfg_data_i<=32'd400;// address

@(posedge clk_i);
cfg_addr_i<=5'b00001; //REG_TX_CH0_CFG
cfg_data_i<={16'd0,6'd0,2'b11,6'd0,2'b01};//mode(00)-2D, size(00)-8bits
@(posedge clk_i);
cfg_addr_i<=5'b00010; //REG_tX_CH0_LEN0
cfg_data_i<=32'd12;// length
@(posedge clk_i);
cfg_addr_i<=5'b00011; //REG_tX_CH0_LEN1
cfg_data_i<=32'd12;// length
@(posedge clk_i);
cfg_addr_i<=5'b00100; //REG_tX_CH0_LEN2
cfg_data_i<=32'd12;// length 
  
@(posedge clk_i);
cfg_addr_i<=5'b00110; //REG_TX_CH1_CFG  
cfg_data_i<={16'd0,6'd0,2'b11,6'd0,2'b01};//mode(00)-2D, size(00)-8bits 
@(posedge clk_i);
cfg_addr_i<=5'b00111; //REG_tX_CH1_LEN0
cfg_data_i<=32'd4;// length
@(posedge clk_i);
cfg_addr_i<=5'b01000; //REG_tX_CH1_LEN1
cfg_data_i<=32'd3;// length
@(posedge clk_i);
cfg_addr_i<=5'b01001; //REG_tX_CH1_LEN2
cfg_data_i<=32'd0;// length

@(posedge clk_i);
cfg_addr_i<=5'b01011; //REG_RX_CH_CFG
cfg_data_i<={16'd0,6'd0,2'b01,6'd0,2'b01};//mode(00)-2D_Row, size(00)-8bits 
@(posedge clk_i);
cfg_addr_i<=5'b01100; //REG_RX_CH_LEN0
cfg_data_i<=32'd4;// length 
@(posedge clk_i);
cfg_addr_i<=5'b01101; //REG_RX_CH_LEN1
cfg_data_i<=32'd3;// length
@(posedge clk_i);
cfg_addr_i<=5'b01110; //REG_RX_CH_LEN2
cfg_data_i<=32'd50;// length 

@(posedge clk_i);
cfg_addr_i<=5'b01111; //REG_AU_CFG
cfg_data_i<={11'd0,5'd0,4'd0,4'b1101,8'd0};// shift-by-0, not-bypass, not-signed

@(posedge clk_i);
cfg_addr_i<=5'b10111; //REG_FILT_CMD
cfg_data_i<={27'd0,5'b10111};// start cmd

@(posedge clk_i);
cfg_addr_i<=5'b10110; //REG_FILT
cfg_data_i<={28'd0,4'b0000};// CONN_MODE_0

@(posedge clk_i);
cfg_valid_i<=1'b0;

@(posedge clk_i);
filter_tx_ch0_gnt_i<=1'b1;
filter_tx_ch0_valid_i<=1'b1;
filter_tx_ch0_data_i<=32'd23;

filter_tx_ch1_gnt_i<=1'b1;
filter_tx_ch1_valid_i<=1'b1;
filter_tx_ch1_data_i<=32'd35;

@(posedge clk_i);
filter_rx_ch_ready_i<=1'b1; //hanging here

repeat(15)@(posedge clk_i);
filter_rx_ch_ready_i<=1'b0;

filter_id_i<='h0; //unused
filter_data_i<='h0;
filter_datasize_i<='h0;
filter_valid_i<='h0;
filter_sof_i<='h0;
filter_eof_i<='h0; 

    #5000;
    $finish();
    
  end
  
  wrapper#()// udma_filter #() //
  dut(clk_i,
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
 filter_tx_ch0_addr_o,
 filter_tx_ch0_datasize_o,
 filter_tx_ch0_gnt_i,

 filter_tx_ch0_valid_i,
 filter_tx_ch0_data_i,
 filter_tx_ch0_ready_o,

 filter_tx_ch1_req_o,
 filter_tx_ch1_addr_o,
 filter_tx_ch1_datasize_o,
 filter_tx_ch1_gnt_i,

 filter_tx_ch1_valid_i,
 filter_tx_ch1_data_i,
 filter_tx_ch1_ready_o,

 filter_rx_ch_addr_o,
 filter_rx_ch_datasize_o,
 filter_rx_ch_valid_o,
 filter_rx_ch_data_o,
 filter_rx_ch_ready_i,

 filter_id_i,
 filter_data_i,
 filter_datasize_i,
 filter_valid_i,
 filter_sof_i,
 filter_eof_i,
 filter_ready_o);
 
endmodule
