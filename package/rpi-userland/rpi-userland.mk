################################################################################
#
# rpi-userland
#
################################################################################

RPI_USERLAND_VERSION = d28009949fe97631373ae4e5ab9ba7ed61910ee7
#ba753c1a7f68d7a2e00edaf03364eef001e233ef
#6f530690af1b6bfc0eab463a804be7bf24fb8d4a
RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
RPI_USERLAND_LICENSE = BSD-3c
RPI_USERLAND_LICENSE_FILES = LICENCE
RPI_USERLAND_INSTALL_STAGING = YES
RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release

ifeq ($(BR2_PACKAGE_WAYLAND),y)
RPI_USERLAND_DEPENDENCIES += wayland
RPI_USERLAND_CONF_OPT += -DBUILD_WAYLAND=1
endif

define RPI_USERLAND_POST_STAGING_PKGCONFIG
	(cd $(STAGING_DIR)/usr/include; ln -sfn VG vg)
endef

define RPI_USERLAND_POST_TARGET_CLEANUP
	rm -f $(TARGET_DIR)/usr/bin/raspi*
	rm -f $(TARGET_DIR)/etc/init.d/vcfiled
	rm -Rf $(TARGET_DIR)/usr/src
endef

RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_POST_STAGING_PKGCONFIG
RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP

$(eval $(cmake-package))
