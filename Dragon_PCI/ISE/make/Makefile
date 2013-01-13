#
# Makefile for Xilinx Spartan 2 on KNJN DragonPCI board
#
# You should first add Xilinx variables to your PATH:
#
# $ source /opt/Xilinx/10.1/ISE/settings32.sh 
#

# Opts for for DragonPCI board
BITGEN_OPTS= -g UnusedPin:Pullnone

# FPGA model
FPGA= xc2s100-6tq144

#
# Design sourcefile (.v/.vhd)
#

#SRC= you_should_specify_a_name_here
SRC= myled.v

#
# Rules
#

# Verilog / VHDL
ifneq (,$(findstring vhd,$(SRC)))
	HDL=VHDL
	PRG=$(SRC:.vhd=)
else
        HDL=Verilog
	PRG=$(SRC:.v=)
endif

# UCF
UCF= $(PRG).ucf

# Bit file (target)
BIT= $(PRG).bit

all: build/$(PRG).bit

build/$(BIT): build/parout.ncd
	cd build && (bitgen -w -g StartUpClk:CClk $(BITGEN_OPTS) parout.ncd $(BIT) $(PRG).pcf; ls -l *.bit)

build/parout.ncd: build/$(PRG).ncd
	cd build && par -w $(PRG).ncd parout.ncd $(PRG).pcf

build/$(PRG).ncd: build/$(PRG).ngd
	cd build && map -detail -pr b $(PRG).ngd

build/$(PRG).ngd:  build/$(PRG).ngc
	cd build && ngdbuild -p $(FPGA) -uc ../$(UCF) $(PRG).ngc

build/$(PRG).ngc: $(SRC)
	cd build && echo "run -ifn ../$(SRC) -ifmt $(HDL) -ofn $(PRG) -p xc2s100-6tq144 -opt_mode Speed -opt_level 1" | xst

clean:
	rm -rf build/*




