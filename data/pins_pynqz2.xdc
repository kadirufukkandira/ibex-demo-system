## PYNQ-Z2 pins for the Ibex Demo System
## Pin numbers from the Xilinx PYNQ-Z2 base.xdc

## Clock: 125 MHz
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { IO_CLK }];
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { IO_CLK }];

## LEDs
set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];

## RGB LEDs: [0..2] = LD4 B,G,R   [3..5] = LD5 B,G,R
set_property -dict { PACKAGE_PIN L15 IOSTANDARD LVCMOS33 } [get_ports { RGB_LED[0] }];
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { RGB_LED[1] }];
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports { RGB_LED[2] }];
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports { RGB_LED[3] }];
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports { RGB_LED[4] }];
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports { RGB_LED[5] }];

## Switches
set_property -dict { PACKAGE_PIN M20 IOSTANDARD LVCMOS33 } [get_ports { SW[0] }];
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { SW[1] }];

## Buttons (BTN[3] is reset)
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS33 } [get_ports { BTN[0] }];
set_property -dict { PACKAGE_PIN D20 IOSTANDARD LVCMOS33 } [get_ports { BTN[1] }];
set_property -dict { PACKAGE_PIN L20 IOSTANDARD LVCMOS33 } [get_ports { BTN[2] }];
set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS33 } [get_ports { BTN[3] }];

## UART on Pmod JB, Digilent Pmod Type 3 layout: JB2 = TX, JB3 = RX
set_property -dict { PACKAGE_PIN Y14 IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 PULLUP true } [get_ports { UART_RX }];
