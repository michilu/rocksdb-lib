#!/bin/bash -x

QEMU_USER_STATIC_DOWNLOAD_URL="https://github.com/multiarch/qemu-user-static/releases/download"
QEMU_USER_STATIC_LATEST_TAG=$(curl -s https://api.github.com/repos/multiarch/qemu-user-static/tags \
    | grep 'name.*v[0-9]' \
    | head -n 1 \
    | cut -d '"' -f 4)


for i in $(find . -type f -name "Dockerfile" -print); do

BUILD_ARCH=$(echo "${i}" | cut -d '/' -f 2)
QEMU_USER_STATIC_ARCH=$(
  [ "${BUILD_ARCH::3}" == "arm" ] && echo "arm"
)
[ -z "${QEMU_USER_STATIC_ARCH}" ] && continue

(
cd ${i%/*}
curl -L "${QEMU_USER_STATIC_DOWNLOAD_URL}/${QEMU_USER_STATIC_LATEST_TAG}/x86_64_qemu-${QEMU_USER_STATIC_ARCH}-static.tar.gz" \
    | tar xzv
)

done


