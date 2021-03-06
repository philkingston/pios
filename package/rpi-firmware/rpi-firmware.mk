################################################################################
#
# rpi-firmware
#
################################################################################

RPI_FIRMWARE_VERSION = b7bbd3d1683e9f3bb11ef86b952adee71e83862f
#f2275b92477d1a01f45f321d648f0eeeeeb0a67e
#df36e8dd56f042603f1ad4d26921b56009415165
RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
RPI_FIRMWARE_LICENSE = BSD-3c
RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom

ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_WIFI),y)
define RPI_FIRMWARE_INSTALL_TARGET_WIFI
	grep -q 'wlan0' $(TARGET_DIR)/etc/network/interfaces || \
		echo -e '\n# Configure wireless\nauto wlan0\niface wlan0 inet dhcp\nwpa-roam /etc/wpa_supplicant.conf\npre-up killall wpa_supplicant; wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 -B -P /var/run/wpa_supplican' >> $(TARGET_DIR)/etc/network/interfaces
endef
endif

define RPI_FIRMWARE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
	grep -q 'eth0' $(TARGET_DIR)/etc/network/interfaces || \
		echo -e '# Configure ethernet\nauto eth0\niface eth0 inet dhcp\npre-up sleep 2' >> $(TARGET_DIR)/etc/network/interfaces
	$(RPI_FIRMWARE_INSTALL_TARGET_WIFI)
	mkdir -p $(TARGET_DIR)/boot
	grep -q '^/dev/mmcblk0p1' $(TARGET_DIR)/etc/fstab || \
		echo -e '/dev/mmcblk0p1 /boot vfat defaults 0 0' >> $(TARGET_DIR)/etc/fstab
endef

$(eval $(generic-package))
