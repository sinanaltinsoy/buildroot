SOCKET_PACKAGE_VERSION = 72a35bd77f1f96b3f1d4af6ee51b76273cb09494
SOCKET_PACKAGE_SITE = git@github.com:sinanaltinsoy/buildroot.git
SOCKET_PACKAGE_SITE_METHOD = git
SOCKET_PACKAGE_GIT_SUBMODULES = YES

define SOCKET_PACKAGE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/app/src all
endef

define SOCKET_PACKAGE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/app/src/socket_package $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/app/src/socket_package.sh $(TARGET_DIR)/etc/init.d/S99socketpackage
endef

$(eval $(generic-package))