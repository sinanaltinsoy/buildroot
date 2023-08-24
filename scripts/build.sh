#!/bin/bash

#DIRECTORIES

MAIN_DIR=$(pwd)/..
BUILDROOT_DIR=${MAIN_DIR}/buildroot
EXTERNAL_PACKAGES_DIR=${MAIN_DIR}/external_packages

#FILES

DEFAULT_QEMU_DEFCONFIG=${BUILDROOT_DIR}/configs/qemu_aarch64_virt_defconfig
MODIFIED_QEMU_DEFCONFIG=${EXTERNAL_PACKAGES_DIR}/configs/qemu_defconfig

git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`

if [ ! -e ${BUILDROOT_DIR}/.config ]
then
	echo "MISSING BUILDROOT CONFIGURATION FILE"

	if [ -e ${MODIFIED_QEMU_DEFCONFIG} ]
	then
		echo "USING MODIFIED QEMU DEFCONFIG FILE"
		make -C ${BUILDROOT_DIR} defconfig BR2_EXTERNAL=${EXTERNAL_PACKAGES_DIR} BR2_DEFCONFIG=${MODIFIED_QEMU_DEFCONFIG}
	else
		echo "MODIFIED QEMU DEFCONFIG FILE IS MISSING"
	fi
else
	echo "USING EXISTING BUILDROOT CONFIG"
	make -C ${BUILDROOT_DIR} BR2_EXTERNAL=${EXTERNAL_PACKAGES_DIR}
fi
