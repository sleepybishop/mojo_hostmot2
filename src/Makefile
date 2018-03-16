ifneq ($(origin XILINX),environment)
$(error No XILINX enviroment settings found, source the relevant settings.sh into the shell before invoking make)
endif

#
# requires xilinx webpack ise (tested with 14.7)
#

CHIP:=spartan6
PART:=xc6slx9-tqg144-2

TARGET_BITFILES=
TARGET_BITFILES+=6i25_G540_7i76_CUSTOM_34.bit
TARGET_BITFILES+=7i90spi_JUSTIO_72.bit
TARGET_BITFILES+=mojov3spi_MOJO_IO_72.bit
TARGET_BITFILES+=mojov3spi_MOJO_ULTIMAKER_72.bit
TARGET_BITFILES+=7i92_G540_7i76_CUSTOM_34.bit

all: $(TARGET_BITFILES)

board/mojov3spi.vhd: top/TopMOJOSPIHostMot2.vhd
	sed s/@Card@/mojov3_x9card/g $< | sed s/TopMOJOSPIHostMot2/tophm2/g > $@

board/7i90spi.vhd: top/TopGCSPIHostMot2.vhd
	sed s/@Card@/i90_x9card/g $< | sed s/TopGCSPIHostMot2/tophm2/g > $@

board/7i90.vhd: top/TopEPPSHostMot2.vhd
	sed s/@Card@/i90_x9card/g $< | sed s/TopEPPSHostMot2/tophm2/g > $@

board/7i92.vhd: top/TopEthernet16HostMot2.vhd
	sed s/@Card@/i92_x9card/g $< | sed s/TopEthernetHostMot2/tophm2/g > $@

board/6i25.vhd: top/TopPCIHostMot2.vhd
	sed s/@Card@/Sixi25_x9card/g $< | sed s/TopPCIHostMot2/tophm2/g > $@

out/%.vhd: board/7i92.vhd board/6i25.vhd board/7i90spi.vhd board/7i90.vhd board/mojov3spi.vhd
	sed s/@Pin@/$(subst .vhd,,$(subst $(firstword $(subst _, ,$*)),PIN,$(notdir $@)))/g board/$(firstword $(subst _, ,$*)).vhd > $@

%.prj: out/%.vhd
	sh ./vhd2prj.sh $*

%.xst:
	cat $(CHIP)xst | sed s/toplevel/$*/g | sed s/targetpart/$(PART)/g > $@

%.ngc: %.xst %.prj
	# synthesize
	mkdir -p xst/$*.tmp
	xst -intstyle ise -ifn $< 

%.ngd: %.ngc constraints/7i92.ucf constraints/6i25.ucf constraints/7i90.ucf constraints/7i90spi.ucf constraints/mojov3spi.ucf
	ngdbuild -intstyle ise -dd _ngo -aut -nt timestamp -uc constraints/$(firstword $(subst _, ,$*)).ucf -p $(PART) $< $@
 
%.pcf: %.ngd
	# map
	map -intstyle ise -p $(PART) -w -logic_opt off -ol high -t 1 -register_duplication off -r 4 -global_opt off -ir off -pr b -power off -o $*_map.ncd $< $@

%.ncd: %.pcf
	# place and route
	par -w -intstyle ise -ol high -mt off $*_map.ncd $@ $<
 
%.bit: %.pcf %.ncd $(CHIP).ut
	bitgen -intstyle ise -f $(CHIP).ut $*.ncd $@ $<

clean:
	$(RM) netlist.lst *.bld *.lso *.ngm *.ncd *.mrp *.map *.xrpt *.ngc *.ngd *.ngr *.pcf *.prj  *.srp *.xml *.syr *.xml *.xst
	$(RM) -rf xlnx_auto_0_xdb _xmsgs _ngo xst 
	$(RM) *.html *.log *.xpi *.unroutes *.ptwx *.par *.txt *.csv *.pas *.pad *.drc *.xwbt *.bgn 
	$(RM) board/*.vhd out/*.vhd

