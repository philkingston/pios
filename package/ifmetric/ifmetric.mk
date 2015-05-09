################################################################################
#
# ifmetric
#
################################################################################

IFMETRIC_VERSION = 0.3
IFMETRIC_SITE = http://0pointer.de/lennart/projects/ifmetric
IFMETRIC_CONF_OPT = --disable-lynx
IFMETRIC_LICENSE = GPLv2+
IFMETRIC_LICENSE_FILES = COPYING

$(eval $(autotools-package))
