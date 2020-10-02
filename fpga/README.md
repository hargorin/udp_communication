# Vivado HLx project

## Folder structure
```
.
├── build                           # Output files
│   └── cores                       # Generated cores
├── config                          # Board configuration
├── cores                           # IP core definitions
│   ├── led_blinking_v1_0			# Set up ARTIX-7
├── projects                        # Projects
│   ├── blinky                    	# initial project for set up the FPGA
├── scripts                         # Used for build process
├── simulation                      # Simulation ressources
├── src
│   └── constraints                 # Global constraints
└── unisim                          # Simulation sources
```

## Build Process
The project to be built is defined in the Makefile variable ```NAME```.

### Build all
```bash
make
```

### Partial Builds
```bash
make cores      # Build IP cores only
make project    # Build Project only
make impl       # Run Synthesis and Implementation only, good for hosts
				#   without the necessary licenses installed
make bit        # Run Synthesis, Implementation and generate bitstream
make flash      # Configure FPGA
```

## Simulation
The Simulation requires ghdl.
```bash
# Tested with ghdl version 0.37
sudo apt install ghdl
```

Run simulation with the make commant sim and variable ```TOP``` that holds the name of the entity to be simulated. For example
```bash
make TOP=led_blinking_tb sim
```

All testbenches can be fount using
```bash
find cores -name *tb.vhd
# cores/led_blinking_v1_0/bench/led_blinking_tb.vhd
```

The results are located in ```build/ghdl```. Open the file ```build/ghdl/*.ghw``` or ```*.vcd``` with you favourite wave viewer (gtkwave for example)
```bash
sudo apt install gtkwave
gtkwave
```

Clean simulation results using
```bash
make clean-sim
```
