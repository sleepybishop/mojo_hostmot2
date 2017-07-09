## fpga firmware
the firmware is a simplified version of the [mesa hostmot2 firmware](https://github.com/LinuxCNC/hostmot2-firmware) tailored to support only newer hardware.
 * mesa 6i25
 * mesa 7i90
 * mesa 7i92
 * embmicro mojo v3
 
## raspberry pi 3 + mojo v3 fpga wiring

| LINE  | RPI PIN | MOJO PIN |
| ----- | ------- | -------- |
| MOSI  | P1-19   | P17      |
| MISO  | P1-21   | P15      |
| CLK   | P1-23   | P24      |
| CE0   | P1-24   | P22      |


