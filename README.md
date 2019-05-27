## mojo_hostmot2
this is a modified version of the [mesa hostmot2 firmware](https://github.com/LinuxCNC/hostmot2-firmware) tailored to support the embedded micro mojo v3.
 
 * analog support via avr interface
 * 72 io pins
 * decoded bspi mode by default
 
## raspberry pi 3 + mojo v3 fpga wiring

| LINE  | RPI PIN | MOJO PIN |
| ----- | ------- | -------- |
| MOSI  | P1-19   | P17      |
| MISO  | P1-21   | P15      |
| CLK   | P1-23   | P24      |
| CE0   | P1-24   | P22      |


