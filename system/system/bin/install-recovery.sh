#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:9c0562473e95e3567f241c7c078445f9f55d461b; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:53902986fc7933badc08c7fac59e5689fccda9f9 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:9c0562473e95e3567f241c7c078445f9f55d461b && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
