#
# Makefile for the Linux Wireless network device drivers.
#
#ARCH:=arm64
#CROSS_COMPILE:=/home/prince/LubanCatWrt/staging_dir/toolchain-aarch64_generic_gcc-12.3.0_musl/bin/aarch64-openwrt-linux-musl-
#KERNEL_DIR:=/home/prince/LubanCatWrt/build_dir/target-aarch64_generic_musl/linux-rockchip_armv8/linux-6.1.41
#export STAGING_DIR=/home/prince/LubanCatWrt/staging_dir
export CONFIG_RTL8821CS = m
obj-y += rtl8821cs/

all:
	$(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERNEL_DIR) M=$(shell pwd) modules

strip:
	$(CROSS_COMPILE)strip $(MODULE_NAME).ko --strip-unneeded

clean:
#	$(MAKE) -C $(KSRC) M=$(shell pwd) clean
#	cd hal ; rm -fr */*/*/*.mod.c */*/*/*.mod */*/*/*.o */*/*/.*.cmd */*/*/*.ko
#	cd hal ; rm -fr */*/*.mod.c */*/*.mod */*/*.o */*/.*.cmd */*/*.ko
#	cd hal ; rm -fr */*.mod.c */*.mod */*.o */.*.cmd */*.ko
#	cd hal ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
#	cd core ; rm -fr */*.mod.c */*.mod */*.o */.*.cmd */*.ko
#	cd core ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
#	cd os_dep/linux ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
#	cd os_dep ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
#	cd platform ; rm -fr *.mod.c *.mod *.o .*.cmd *.ko
	find . -name *.d -delete
	find . -name *.ko | xargs -i rm -rf {}
	find . -name Module.symvers | xargs -i rm -rf {}
	find . -name Module.markers | xargs -i rm -rf {}
	find . -name modules.order | xargs -i rm -rf {}
	find . -name *.mod.c | xargs -i rm -rf {}
	find . -name *.mod | xargs -i rm -rf {}
	find . -name *.o | xargs -i rm -rf {}
	find . -name *.cmd | xargs -i rm -rf {}
	find . -name *~ | xargs -i rm -rf {}
	rm -fr .tmp_versions
#	rm -fr Module.symvers ; rm -fr Module.markers ; rm -fr modules.order
#	rm -fr *.mod.c *.mod *.o .*.cmd *.ko *~
#	rm -fr .tmp_versions