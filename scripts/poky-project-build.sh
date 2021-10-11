#!/bin/bash
git clone --depth 1 git://git.yoctoproject.org/poky -b hardknott poky
git clone https://github.com/superna9999/meta-meson.git meta-meson -b hardknott
git clone  git://git.openembedded.org/meta-openembedded -b hardknott
git  clone git://github.com/kraj/meta-clang -b hardknott 
git clone git://git.openembedded.org/meta-python2 -b hardknott 
git clone https://github.com/OSSystems/meta-browser.git -b master
# git clone -b gatesgarth git://git.openembedded.org/meta-openembedded
# git clone -b gatesgarth git://git.yoctoproject.org/meta-raspberrypi
# git clone -b gatesgarth https://github.com/meta-qt5/meta-qt5
pwd 
ls -al
source poky/oe-init-build-env # in build dir
pwd

bitbake-layers add-layer ../meta-openembedded/meta-oe/
bitbake-layers add-layer ../meta-meson/
bitbake-layers add-layer ../meta-clang/
bitbake-layers add-layer ../meta-python2/
bitbake-layers add-layer ../meta-browser/meta-chromium/
# bitbake-layers show-layers

# bitbake-layers add-layer ../meta-raspberrypi
# bitbake-layers add-layer ../meta-qt5

# modify local.conf to build raspberrypi3 64-bit system
sed -i '/^MACHINE/s/= .*$/= "khadas-vim3l-sdboot"/g' conf/local.conf
sed -i '/^#SDKMA/s/#\(.*\)=.*$/\1= "x86_64"/g'  conf/local.conf
sed -i '$a\BB_GENERATE_MIRROR_TARBALLS = "1"'  conf/local.conf
sed -i '$a\INHERIT += "buildhistory"'  conf/local.conf
sed -i '$a\BUILDHISTORY_COMMIT = "1"'  conf/local.conf
# sed -i '$a\BB_NUMBER_THREADS = "2"'  conf/local.conf
# sed -i '$a\PARALLEL_MAKE = "-j 2"'  conf/local.conf
sed -i '$a\PACKAGECONFIG_append_pn-chromium = " component-build"'  conf/local.conf
sed -i '$a\PACKAGECONFIG_append_pn-chromium = " proprietary-codecs"'  conf/local.conf
sed -i '$a\PACKAGECONFIG_append_pn-chromium = " use-vaapi"'  conf/local.conf
sed -i '$a\INHERIT += "rm_work"'  conf/local.conf
sed -i '$a\IMAGE_INSTALL_append = " chromium-x11"'  conf/local.conf

sed -i '$a\SOURCE_MIRROR_URL ?= "file:///Dlsrc/"'  conf/local.conf
sed -i '$a\INHERIT += "own-mirrors"'  conf/local.conf
sed -i '$a\BB_NO_NETWORK = "1"'  conf/local.conf

sed -i '$a\SSTATE_DIR ?= "/Sstate-cache"'  conf/local.conf
cat /Dlsrc/collect-srcrevs.txt >> conf/local.conf

# sed -i '$a\SRCREV_pn-binutils = "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"'  conf/local.conf
# sed -i '$a\SRCREV_pn-btrfs-tools = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"'  conf/local.conf
# sed -i '$a\SRCREV_pn-bzip2 = "f9061c030a25de5b6829e1abf373057309c734c0"'  conf/local.conf
# sed -i '$a\SRCREV_pn-dnf = "c826d7db401ebf9b59b2fa74570a919e4af2673e"'  conf/local.conf
# sed -i '$a\SRCREV_pn-e2fsprogs = "3114c623f56b0d61f5f34b85f7b23d28f6c848c0"'  conf/local.conf
# sed -i '$a\SRCREV_pn-file = "87731415de945660b00f02207d8e9d986ef9b82e"'  conf/local.conf
# sed -i '$a\SRCREV_pn-glibc = "9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3"'  conf/local.conf
# sed -i '$a\SRCREV_pn-gnome-desktop-testing = "4decade67b29ad170fcf3de148e41695fc459f48"'  conf/local.conf
# sed -i '$a\SRCREV_pn-init-system-helpers = "dbd9197569c0935029acd5c9b02b84c68fd937ee"'  conf/local.conf
# sed -i '$a\SRCREV_pn-iputils = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"'  conf/local.conf
# sed -i '$a\SRCREV_pn-kmod = "1ccfe994287119cc6cef37a7ca4c529d89de4b95"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libcomps = "b213f749405d84e989b25e183bcf28ce701696dd"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libdnf = "85278894f21bc1957dc47a2a09ddacf59bc3cda8"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libjitterentropy = "747bf030b0ea9c44548b4e29bcfab7ae416675fc"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libmodulemd = "aaed38c899a958a88a6a368a70510e350ebe336c"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libnsl2 = "fbad7b36acaa89a54023930af70805649f962999"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libnss-mdns = "41c9c5e78f287ed4b41ac438c1873fa71bfa70ae"'  conf/local.conf
# sed -i '$a\SRCREV_pn-librepo = "a244d78bab11510408fb9413f1c78c2f56c69fa5"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libsolv = "4bc791c0d235eb14bfe4c5da607206bfdfa6983d"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libxcrypt = "94d84f92ca123d851586016c4678eb1f21c19029"'  conf/local.conf
# sed -i '$a\SRCREV_pn-llvm-project-source-12.0.0 = "d28af7c654d8db0b68c175db5ce212d74fb5e9bc"'  conf/local.conf
# sed -i '$a\SRCREV_pn-mobile-broadband-provider-info = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"'  conf/local.conf
# sed -i '$a\SRCREV_pn-ncurses = "a669013cd5e9d6434e5301348ea51baf306c93c4"'  conf/local.conf
# sed -i '$a\SRCREV_pn-net-tools = "80d7b95067f1f22fece9537dea6dff53081f4886"'  conf/local.conf
# sed -i '$a\SRCREV_pn-procps = "19a508ea121c0c4ac6d0224575a036de745eaaf8"'  conf/local.conf
# sed -i '$a\SRCREV_pn-psmisc = "5fab6b7ab385080f1db725d6803136ec1841a15f"'  conf/local.conf
# sed -i '$a\SRCREV_pn-ptest-runner = "bcb82804daa8f725b6add259dcef2067e61a75aa"'  conf/local.conf
# sed -i '$a\SRCREV_pn-rng-tools = "2ea13473fd5bfea3c861dc0e23bd65e2afe8007b"'  conf/local.conf
# sed -i '$a\SRCREV_pn-rpm = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"'  conf/local.conf
# sed -i '$a\SRCREV_pn-shared-mime-info = "18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70"'  conf/local.conf
# sed -i '$a\SRCREV_pn-sysklogd = "f507ed8ff3f1e9d71bb6f85acbf5d14b2fa4e5f7"'  conf/local.conf
# sed -i '$a\SRCREV_pn-ca-certificates = "181be7ebd169b4a6fb5d90c3e6dc791e90534144"'  conf/local.conf
# sed -i '$a\SRCREV_pn-linux-firmware = "3ddc301c272f081aa5513c1934f6d530bf80de4a"'  conf/local.conf
# sed -i '$a\SRCREV_pn-netbase = "1c892c96a078ef28ec1a94681b3a0da7a3d545f7"'  conf/local.conf
# sed -i '$a\SRCREV_pn-update-rc.d = "8636cf478d426b568c1be11dbd9346f67e03adac"'  conf/local.conf
# sed -i '$a\SRCREV_pn-linux-meson64 = "7d2a07b769330c34b4deabeed939325c77a7ec2f"'  conf/local.conf
# sed -i '$a\SRCREV_pn-binutils-cross-aarch64 = "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"'  conf/local.conf
# sed -i '$a\SRCREV_pn-binutils-native = "7651a4871c225925ffdfda0a8c91a6ed370cd9a1"'  conf/local.conf
# sed -i '$a\SRCREV_pn-bmap-tools-native = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"'  conf/local.conf
# sed -i '$a\SRCREV_pn-brotli-native = "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"'  conf/local.conf
# sed -i '$a\SRCREV_pn-btrfs-tools-native = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"'  conf/local.conf
# sed -i '$a\SRCREV_pn-bzip2-native = "f9061c030a25de5b6829e1abf373057309c734c0"'  conf/local.conf
# sed -i '$a\SRCREV_pn-c-ares-native = "74a1426ba60e2cd7977e53a22ef839c87415066e"'  conf/local.conf
# sed -i '$a\SRCREV_pn-createrepo-c-native = "909a0636665ed96f97babc3b887f9badc88875c3"'  conf/local.conf
# sed -i '$a\SRCREV_glibc_pn-cross-localedef-native = "9826b03b747b841f5fc6de2054bf1ef3f5c4bdf3"'  conf/local.conf
# sed -i '$a\SRCREV_localedef_pn-cross-localedef-native = "bd644c9e6f3e20c5504da1488448173c69c56c28"'  conf/local.conf
# sed -i '$a\SRCREV_pn-dnf-native = "c826d7db401ebf9b59b2fa74570a919e4af2673e"'  conf/local.conf
# sed -i '$a\SRCREV_pn-e2fsprogs-native = "3114c623f56b0d61f5f34b85f7b23d28f6c848c0"'  conf/local.conf
# sed -i '$a\SRCREV_pn-file-native = "87731415de945660b00f02207d8e9d986ef9b82e"'  conf/local.conf
# sed -i '$a\SRCREV_pn-gnu-config-native = "6faca61810d335c7837f320733fe8e15a1431fc2"'  conf/local.conf
# sed -i '$a\SRCREV_pn-kern-tools-native = "d220b063852245fdd16b9731a395ace525f932d6"'  conf/local.conf
# sed -i '$a\SRCREV_pn-kmod-native = "1ccfe994287119cc6cef37a7ca4c529d89de4b95"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libcomps-native = "b213f749405d84e989b25e183bcf28ce701696dd"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libdnf-native = "85278894f21bc1957dc47a2a09ddacf59bc3cda8"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libmodulemd-native = "aaed38c899a958a88a6a368a70510e350ebe336c"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libnsl2-native = "fbad7b36acaa89a54023930af70805649f962999"'  conf/local.conf
# sed -i '$a\SRCREV_pn-librepo-native = "a244d78bab11510408fb9413f1c78c2f56c69fa5"'  conf/local.conf
# sed -i '$a\SRCREV_pn-libsolv-native = "4bc791c0d235eb14bfe4c5da607206bfdfa6983d"'  conf/local.conf
# sed -i '$a\SRCREV_pn-lz4-native = "d44371841a2f1728a3f36839fd4b7e872d0927d3"'  conf/local.conf
# sed -i '$a\SRCREV_pn-ncurses-native = "a669013cd5e9d6434e5301348ea51baf306c93c4"'  conf/local.conf
# sed -i '$a\SRCREV_pn-ninja-native = "e72d1d581c945c158ed68d9bc48911063022a2c6"'  conf/local.conf
# sed -i '$a\SRCREV_pn-pkgconfig-native = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"'  conf/local.conf
# sed -i '$a\SRCREV_pn-prelink-native = "f9975537dbfd9ade0fc813bd5cf5fcbe41753a37"'  conf/local.conf
# sed -i '$a\SRCREV_pn-pseudo-native = "b988b0a6b8afd8d459bc9a2528e834f63a3d59b2"'  conf/local.conf
# sed -i '$a\SRCREV_pn-rpm-native = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"'  conf/local.conf
# sed -i '$a\SRCREV_pn-shared-mime-info-native = "18e558fa1c8b90b86757ade09a4ba4d6a6cf8f70"'  conf/local.conf
# sed -i '$a\SRCREV_pn-squashfs-tools-native = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"'  conf/local.conf
# sed -i '$a\SRCREV_pn-u-boot-tools-native = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"'  conf/local.conf
# sed -i '$a\SRCREV_pn-update-rc.d-native = "8636cf478d426b568c1be11dbd9346f67e03adac"'  conf/local.conf












cat conf/local.conf

cat conf/bblayers.conf


#sed -i '/SDKMACHINE/aTOOLCHAIN_TARGET_TASK_append = "libc-staticdev"' conf/local.conf
#sed -i '/qt5-ptest/aPACKAGECONFIG_remove = "tslib"' ../meta-qt5/recipes-qt/qt5/qtbase_git.bb

# building image
#bitbake core-image-base
#bitbake qtbase
#bitbake core-image-base -c populate_sdk
# buildhistory-collect-srcrevs -a
bitbake amlogic-image-headless-sd  -c populate_sdk_ext
# bitbake chromium --runonly=fetch
# bitbake amlogic-image-headless-sd  --runonly=fetch
# buildhistory-collect-srcrevs -a > collect-srcrevs.txt
# bitbake amlogic-image-headless-sd --runonly=fetch
# buildhistory-collect-srcrevs -a > collect-srcrevs.txt