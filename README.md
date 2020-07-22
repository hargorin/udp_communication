# udp_communication
UDP/IP communication between FPGA and PC

## Workflow
1. UDP/IP communication on a PC as loopback (server and client)
    * Python
    * Ethernet
2. UDP/IP communication from PC (server) to a FPGA (client) and back
    * Python (PC)
    * VHDL (FPGA)
    * Ethernet to SFP adapter
3. Camera / Display Driver
    * Camera: send images from FPGA to PC
    * Display: Data or images from FPGA to PC or vice versa

