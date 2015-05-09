#############################################################
#
# view20
#
#############################################################

VIEW20_VERSION = master
#4df0e88ae0ba2da6b5e01c737cd1033f2e15ea27
VIEW20_SITE_METHOD = git
VIEW20_SITE = https://github.com/philkingston/pi.git
VIEW20_DEPENDENCIES = qt5base qt5quick1 ffmpeg libv4l

define VIEW20_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_MAKE_ENV) \
		$(HOST_DIR)/usr/bin/qmake \
			DEFINES+=CONFIG_QMLSCENEOMX \
			DEFINES+=CONFIG_APP \
			INCLUDEPATH+=$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
			INCLUDEPATH+=$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
			./PiOmxTextures.pro \
	)
endef

define VIEW20_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define VIEW20_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/piomxtextures_app/piomxtextures_app $(TARGET_DIR)/usr/bin/view20
endef

define VIEW20_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/view20
endef

$(eval $(generic-package))
