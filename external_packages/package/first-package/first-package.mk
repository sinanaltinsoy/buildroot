FIRST_PACKAGE_VERSION = 2bc727cef66af65a6816349a0d990f272c41b4ec
FIRST_PACKAGE_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-sinanaltinsoy.git
FIRST_PACKAGE_SITE_METHOD = git
FIRST_PACKAGE_GIT_SUBMODULES = YES

define FIRST_PACKAGE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define FIRST_PACKAGE_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))