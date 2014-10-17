################################################################################
#
# espeak
#
################################################################################

ESPEAK_VERSION = 1.48
ESPEAK_MINOR_VERSION = 04
ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION).$(ESPEAK_MINOR_VERSION)-source.zip
define ESPEAK_EXTRACT_CMDS
	unzip $(DL_DIR)/$(ESPEAK_SOURCE) -d $(@D)
	mv $(@D)/espeak-$(ESPEAK_VERSION).$(ESPEAK_MINOR_VERSION)-source/* $(@D)
endef
ESPEAK_SITE = http://sourceforge.net/projects/espeak/files/espeak/espeak-$(ESPEAK_VERSION)
ESPEAK_INSTALL_STAGING = YES
ESPEAK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
ESPEAK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
ESPEAK_DEPENDENCIES = host-pkgconf
ESPEAK_LICENSE = MIT
ESPEAK_LICENSE_FILES = COPYING
define ESPEAK_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src
endef
define ESPEAK_INSTALL_TARGET_CMDS
	cd $(@D)/src; \
		$(MAKE) DESTDIR=$(TARGET_DIR) install
endef
ESPEAK_SUBDIR = src
$(eval $(generic-package))
#$(eval $(host-autotools-package))
