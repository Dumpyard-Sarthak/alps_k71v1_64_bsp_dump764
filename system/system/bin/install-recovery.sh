#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:18955168:0c7c3c5f2dc938123c551f1e5b718a70ded21319; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:13167520:cc5d807159eb1dc42067d21285eacee0fd8c62fb \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:18955168:0c7c3c5f2dc938123c551f1e5b718a70ded21319 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
