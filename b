#!/bin/bash
export C=/clang12/bin
export PATH=${C}:$PATH
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
export BOOT_IMAGE_HEADER_VERSION=3
export BASE_ADDRESS=0x80000000
export PAGE_SIZE=4096
export BUILD_VENDOR_DLKM=1
export SUPER_IMAGE_SIZE=0x10000000
export TRIM_UNUSED_MODULES=1
export BRANCH=android12-5.10
export KMI_GENERATION=9
export STOP_SHIP_TRACEPRINTK=1
export IN_KERNEL_MODULES=1
export DO_NOT_STRIP_MODULES=1
export LLVM=1
export DEPMOD=depmod
export DTC=dtc
export BUILD_BOOT_IMG=1
export BUILD_INITRAMFS=1
STOP_SHIP_TRACEPRINTK=1
IN_KERNEL_MODULES=1
DO_NOT_STRIP_MODULES=1

export ABI_DEFINITION=android/abi_gki_aarch64.xml
export KMI_SYMBOL_LIST=android/abi_gki_aarch64_qcom
export ADDITIONAL_KMI_SYMBOL_LISTS="
android/abi_gki_aarch64
android/abi_gki_aarch64_core
android/abi_gki_aarch64_db845c
android/abi_gki_aarch64_exynos
android/abi_gki_aarch64_exynosauto
android/abi_gki_aarch64_fips140
android/abi_gki_aarch64_galaxy
android/abi_gki_aarch64_generic
android/abi_gki_aarch64_hikey960
android/abi_gki_aarch64_imx
android/abi_gki_aarch64_mtk
android/abi_gki_aarch64_oplus
android/abi_gki_aarch64_rockchip
android/abi_gki_aarch64_unisoc
android/abi_gki_aarch64_virtual_device
android/abi_gki_aarch64_vivo
android/abi_gki_aarch64_xiaomi
"
export KMI_SYMBOL_LIST_MODULE_GROUPING=0
export KMI_SYMBOL_LIST_ADD_ONLY=1
export KMI_ENFORCED=1

export MAKE_GOALS="modules dtbs"
export GKI_BUILD_CONFIG=/12/Xiaomi_Kernel_OpenSource/build.config.gki.aarch64
export GKI_SKIP_IF_VERSION_MATCHES=1
export GKI_SKIP_CP_KERNEL_HDR=1

# 编译特定模块
MODULES=(
    drivers/watchdog/gh_virt_wdt
    drivers/watchdog/qcom_wdt_core
    drivers/cpu/qcom_cpu_vendor_hooks
    drivers/clk/qcom/clk-rpmh
    drivers/clk/qcom/gcc-waipio
    drivers/interconnect/qcom/icc-rpmh
    drivers/soc/qcom/qcom_ipcc
    drivers/soc/qcom/qcom_ipc_logging
    drivers/soc/qcom/qcom-pdc
    drivers/regulator/rpmh-regulator
    drivers/devfreq/bwmon
    drivers/cpufreq/qcom-cpufreq-hw
    kernel/sched/walt
    kernel/sched/walt-debug
    net/wireless/cfg80211
    drivers/clk/clk-dummy
    drivers/clk/qcom/clk-qcom
    drivers/soc/qcom/cmd-db
    drivers/mmc/host/cqhci
    drivers/crypto/crypto-qti-common
    drivers/crypto/crypto-qti-hwkm
    drivers/devfreq/dcvs_fp
    drivers/regulator/debug-regulator
    mm/deferred-free-helper
    drivers/clk/qcom/dispcc-diwali
    drivers/clk/qcom/dispcc-waipio
    drivers/clk/qcom/gcc-diwali
    drivers/regulator/gdsc-regulator
    drivers/virt/gh_arm_drv
    drivers/virt/gh_ctrl
    drivers/virt/gh_dbl
    drivers/virt/gh_msgq
    drivers/virt/gh_rm_drv
    drivers/virt/gh_virt_wdt
    drivers/crypto/hwkm
    drivers/interconnect/qcom/icc-bcm-voter
    drivers/interconnect/qcom/icc-debug
    drivers/iommu/iommu-logger
    drivers/edac/kryo_arm64_edac
    drivers/memory/llcc-qcom
    net/mac80211
    drivers/misc/mem_buf_dev
    drivers/misc/mem_buf
    drivers/misc/mem-hooks
    drivers/misc/memory_dump_v2
    drivers/misc/minidump
    drivers/iommu/msm_dma_iommu_mapping
    drivers/pinctrl/qcom/pinctrl-waipio
    drivers/bus/qcom/qnoc-waipio
    drivers/regulator/qti-fixed-regulator
    drivers/misc/reboot-mode
    drivers/tty/serial/msm_geni_serial
    drivers/misc/msm_rtb
    drivers/misc/ns
    drivers/nvmem/nvmem_qcom-spmi-sdam
    drivers/phy/phy-generic
    drivers/phy/qcom/phy-qcom-ufs
    drivers/phy/qcom/phy-qcom-ufs-qmp-v4-waipio
    drivers/pinctrl/qcom/pinctrl-cape
    drivers/pinctrl/qcom/pinctrl-diwali
    drivers/pinctrl/qcom/pinctrl-msm
    drivers/regulator/proxy-consumer
    drivers/soc/qcom/qcom-dcvs
    drivers/soc/qcom/qcom-dload-mode
    drivers/misc/qcom_dma_heaps
    drivers/irqchip/qcom_gic_intr_routing
    drivers/hwspinlock/qcom_hwspinlock
    drivers/iommu/qcom_iommu_util
    drivers/perf/qcom_llcc_pmu
    drivers/perf/qcom-pmu-lib
    drivers/mfd/qcom-spmi-pmic
    drivers/spmi/spmi-pmic-arb
    drivers/soc/qcom/qcom-reboot-reason
    drivers/soc/qcom/qcom_rpmh
    drivers/firmware/qcom-scm
    drivers/watchdog/qcom_wdt_core
    drivers/bus/qcom/qnoc-diwali
    drivers/bus/qcom/qnoc-qos
    net/qrtr
    drivers/regmap/qti-regmap-debugfs
    drivers/regmap/regmap-spmi
    drivers/rtc/rtc-pm8xxx
    drivers/misc/secure_buffer
    drivers/soc/qcom/smem
    drivers/soc/qcom/socinfo
    drivers/regulator/stub-regulator
    drivers/misc/tmecom-intf
    drivers/scsi/ufs/ufshcd-crypto-qti
    drivers/scsi/ufs/ufs_qcom
    drivers/iommu/arm_smmu
    drivers/tty/serial/msm-geni-se
    drivers/misc/mem-offline
    drivers/misc/hwid
    drivers/misc/mi_memory
    kernel/sched/mi_schedule
    kernel/sched/turbo_sched
    drivers/soc/qcom/qcom_aoss
    drivers/phy/qcom/msm_qmp
    drivers/misc/mi_power
    drivers/soc/qcom/qcom_rimps
    drivers/misc/c1dcvs_vendor
    drivers/misc/c1dcvs_scmi
)
kk="-j$(nproc --all) \
LLVM=1 \
LLVM_IAS=1 \
O=O \
CC=clang \
LD=ld.lld \
AR=llvm-ar \
READELF=llvm-readelf \
NM=llvm-nm \
OBJCOPY=llvm-objcopy \
OBJDUMP=llvm-objdump \
STRIP=llvm-strip \
CROSS_COMPILE=aarch64-linux-gnu- \
CROSS_COMPILE_COMPAT=arm-linux-gnueabi- \
CLANG_TRIPLE=aarch64-linux-gnu- \
ARCH=arm64 \
-Werror"
make ${kk} gki_defconfig
make ${kk} vendor/zeus_GKI.config
make ${kk} 
make ${kk} modules dtbs
make ${kk} M=${module} modules
