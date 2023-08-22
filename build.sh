#!/bin/bash

DEFAULT_QEMU_DEFCONFIG=configs/qemu_aarch64_virt_defconfig
MODIFIED_QEMU_DEFCONFIG=external_packages/configs/qemu_defconfig
QEMU_DEFCONFIG=../${MODIFIED_QEMU_DEFCONFIG}
EXTERNAL_PACKAGES_DIR=../external_packages

git submodule init
git submodule sync
git submodule update

set -e 
cd `dirname $0`

if [ ! -e buildroot/.config ]
then
	echo "MISSING BUILDROOT CONFIGURATION FILE"

	if [ -e ${MODIFIED_QEMU_DEFCONFIG} ]
	then
		echo "USING ${MODIFIED_QEMU_DEFCONFIG}"
		make -C buildroot defconfig BR2_EXTERNAL=${EXTERNAL_PACKAGES_DIR} BR2_DEFCONFIG=${QEMU_DEFCONFIG}
	else
		echo "sDEFCONFIG FILE IS MISSING"
	fi
else
	echo "USING EXISTING BUILDROOT CONFIG"
	echo "To force update, delete .config or make changes using make menuconfig and build again."
	make -C buildroot BR2_EXTERNAL=${EXTERNAL_PACKAGES_DIR}

fi
