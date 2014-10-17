#############################################################
#
# corkscrew
#
#############################################################

#CORKSCREW_VERSION = 2.0 
CORKSCREW_SOURCE = corkscrew-2.0.tar.gz
CORKSCREW_SITE = http://www.agroman.net/corkscrew
#CORKSCREW_LICENSE = GPL
#CORKSCREW_LICENSE_FILES = COPYING

$(eval $(autotools-package))
