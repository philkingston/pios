################################################################################
#
# sphinxbase
#
################################################################################

SPHINXBASE_VERSION = 0.8
SPHINXBASE_SOURCE = sphinxbase-$(SPHINXBASE_VERSION).tar.gz
SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/$(SPHINXBASE_VERSION)
#SPHINXBASE_INSTALL_STAGING = YES
#SPHINXBASE_INSTALL_STAGING = YES

SPHINXBASE_CONF_ENV = $(TARGET_CONFIGURE_ARGS) $(TARGET_CONFIGURE_OPTS)

#define SPHINXBASE_CONFIGURE_CMDS
#	(cd $(@D); \
#		$(TARGET_CONFIGURE_ARGS) \
#		$(TARGET_CONFIGURE_OPTS) \
#		CFLAGS="$(TARGET_CFLAGS)" \
#		./configure \
#	)
#endef


#define SPHINXBASE_BUILD_CMDS
#	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
#		LDFLAGS="$(TARGET_LDFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(@D)
#endef

$(eval $(autotools-package))
