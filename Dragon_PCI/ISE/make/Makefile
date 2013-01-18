#
# Makefile for Xilinx Spartan 2 on KNJN DragonPCI board
#
# You should first add Xilinx variables to your PATH:
#
# $ source /opt/Xilinx/10.1/ISE/settings32.sh 
#
#  then
#
# $ mkdir build && make SRC=source_file
#
# source_file (.v, .vhd, .ucf) should be in the Makefile directory
#

# Opts for for DragonPCI board
BITGEN_OPTS= -g UnusedPin:Pullnone

# FPGA model
FPGA= xc2s100-6tq144

# Build in current dir
BUILD= $(shell pwd)

#
# Design sourcefile (.v/.vhd)
#

SRC= you_should_specify_a_name_here

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

all: $(BUILD)/build/$(BIT)

$(BUILD)/build/$(BIT): $(BUILD)/build/parout.ncd
	cd $(BUILD)/build && (bitgen -w -g StartUpClk:CClk $(BITGEN_OPTS) parout.ncd $(BIT) $(PRG).pcf; ls -l *.bit)

$(BUILD)/build/parout.ncd: $(BUILD)/build/$(PRG).ncd
	cd $(BUILD)/build && par -w $(PRG).ncd parout.ncd $(PRG).pcf

$(BUILD)/build/$(PRG).ncd: $(BUILD)/build/$(PRG).ngd
	cd $(BUILD)/build && map -detail -pr b $(PRG).ngd

$(BUILD)/build/$(PRG).ngd:  $(BUILD)/build/$(PRG).ngc $(BUILD)/$(UCF)
	cd $(BUILD)/build && ngdbuild -p $(FPGA) -uc $(BUILD)/$(UCF) $(PRG).ngc

$(BUILD)/build/$(PRG).ngc: $(SRC)
	cd $(BUILD)/build && echo "run -ifn $(BUILD)/$(SRC) -ifmt $(HDL) -ofn $(PRG) -p xc2s100-6tq144 -opt_mode Speed -opt_level 1" | xst

clean:
	rm -rf $(BUILD)/build/*
