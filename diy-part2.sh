#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 修改 firmware 分区大小为 256M 剩余全部空间 (0xfa80000)
sed -i 's/<0x580000 0x2800000>/<0x580000 0xfa80000>/g' target/linux/mediatek/dts/mt7622-netgear-wax206.dts

# 删除 backup 和 dummy 备用分区节点
sed -i '/partition@2d80000/,/};/d' target/linux/mediatek/dts/mt7622-netgear-wax206.dts
sed -i '/partition@5580000/,/};/d' target/linux/mediatek/dts/mt7622-netgear-wax206.dts
