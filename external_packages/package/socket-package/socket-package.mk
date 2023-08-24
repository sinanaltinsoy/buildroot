SOCKET_PACKAGE_VERSION = 2bc727cef66af65a6816349a0d990f272c41b4ec
SOCKET_PACKAGE_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-sinanaltinsoy.git
SOCKET_PACKAGE_SITE_METHOD = git
SOCKET_PACKAGE_GIT_SUBMODULES = YES

define SOCKET_PACKAGE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

define SOCKET_PACKAGE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))