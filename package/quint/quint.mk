#############################################################
#
# quint
#
#############################################################

QUINT_VERSION = c968a8dc8836fa182a271e20819f62890d7b84f6
QUINT_SITE_METHOD = git
QUINT_SITE = https://git.gitorious.org/quint/quint.git
QUINT_DEPENDENCIES = qt5base qt5quick1

define QUINT_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_MAKE_ENV) \
		$(HOST_DIR)/usr/bin/qmake \
			DEFINES+=CONFIG_QMLSCENEOMX \
			DEFINES+=CONFIG_APP \
			INCLUDEPATH+=$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
			INCLUDEPATH+=$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
			./quint.pro \
	)
endef

define QUINT_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QUINT_INSTALL_TARGET_CMDS
	mkdir $(TARGET_DIR)/usr/share/quint
	$(INSTALL) -D -m 0755 $(@D)/quint $(TARGET_DIR)/usr/share/quint
	$(INSTALL) -D -m 0755 $(@D)/*.qml $(TARGET_DIR)/usr/share/quint
	$(INSTALL) -D -m 0755 $(@D)/*.png $(TARGET_DIR)/usr/share/quint
endef

define QUINT_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/bin/quint
endef

$(eval $(generic-package))
