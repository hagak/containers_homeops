#!/usr/bin/env bash
#shellcheck disable=SC2086

APP_DIR="/app/emby"

export AMDGPU_IDS="${APP_DIR}"/extra/share/libdrm/amdgpu.ids
export FONTCONFIG_PATH="${APP_DIR}"/etc/fonts
export LD_LIBRARY_PATH="${APP_DIR}"/lib:"${APP_DIR}"/extra/lib
export OCL_ICD_VENDORS="${APP_DIR}"/extra/etc/OpenCL/vendors
export PCI_IDS_PATH="${APP_DIR}"/share/hwdata/pci.ids
export SSL_CERT_FILE="${APP_DIR}"/etc/ssl/certs/ca-certificates.crt
if [ -d "/lib/x86_64-linux-gnu" ]; then
    export LIBVA_DRIVERS_PATH=/usr/lib/x86_64-linux-gnu/dri:"${APP_DIR}"/extra/lib/dri
fi

exec \
    /app/emby/system/EmbyServer \
        -programdata /config \
        -ffdetect /app/emby/bin/ffdetect \
        -ffmpeg /app/emby/bin/ffmpeg \
        -ffprobe /app/emby/bin/ffprobe \
        -restartexitcode 3
