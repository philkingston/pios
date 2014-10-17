################################################################################
#
# motionlights
#
################################################################################

MOTIONLIGHTS_VERSION = master
MOTIONLIGHTS_SITE_METHOD = git
MOTIONLIGHTS_SITE = https://github.com/philkingston/motionLights.git
MOTIONLIGHTS_DEPENDENCIES = opencv libv4l
MOTIONLIGHTS_AUTORECONF = YES
MOTIONLIGHTS_CONF_OPT = \
	--includedir=$(STAGING_DIR)/usr/include \
	--libdir=$(STAGING_DIR)/usr/lib

$(eval $(autotools-package))
