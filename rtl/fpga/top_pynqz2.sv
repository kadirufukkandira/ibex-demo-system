// Top level for the PYNQ-Z2 board. Connects board IO to the Ibex Demo System.
module top_pynqz2 (
  input        IO_CLK,    // 125 MHz board clock
  input  [1:0] SW,
  input  [3:0] BTN,       // BTN[3] is used as reset
  output [3:0] LED,
  output [5:0] RGB_LED,   // {LD5 R,G,B, LD4 R,G,B}
  input        UART_RX,
  output       UART_TX
);
  parameter SRAMInitFile = "";

  logic        clk_sys, rst_sys_n;
  logic [15:0] gp_o;
  logic [11:0] pwm_o;

  ibex_demo_system #(
    .SRAMInitFile(SRAMInitFile)
  ) u_ibex_demo_system (
    .clk_sys_i (clk_sys),
    .rst_sys_ni(rst_sys_n),

    .gp_i      ({3'b000, SW, BTN[2:0]}),
    .gp_o      (gp_o),
    .pwm_o     (pwm_o),

    .uart_rx_i (UART_RX),
    .uart_tx_o (UART_TX),

    .spi_rx_i  (1'b0),
    .spi_tx_o  (),
    .spi_sck_o (),

    .trst_ni   (1'b1),
    .tms_i     (1'b0),
    .tck_i     (1'b0),
    .td_i      (1'b0),
    .td_o      ()
  );

  // Software drives the green LEDs on GPIO bits 4 to 7
  assign LED     = gp_o[7:4];
  assign RGB_LED = pwm_o[5:0];

  // 125 MHz in, 50 MHz system clock out
  clkgen_pynqz2 clkgen (
    .IO_CLK,
    .IO_RST_N (~BTN[3]),
    .clk_sys,
    .rst_sys_n
  );
endmodule
