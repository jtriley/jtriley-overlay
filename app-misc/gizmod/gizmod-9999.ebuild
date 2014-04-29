# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2 python cmake-utils linux-info

DESCRIPTION="Input event scripting utility that has special support for fancy keyboards, mice, USB dials and more"
HOMEPAGE="http://gizmod.sourceforge.net"
SRC_URI=""
EGIT_REPO_URI="https://github.com/jtriley/gizmod.git"
EGIT_BRANCH="develop"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE="libvisual"
RDEPEND="x11-libs/libXext
	amd64? ( >=dev-libs/boost-1.36[python] )
	|| ( dev-libs/boost:0 dev-libs/boost[python] )
	x11-libs/libICE
	media-libs/alsa-lib
	libvisual? ( media-libs/libvisual )"
DEPEND="${RDEPEND}"

CONFIG_CHECK="INPUT_EVDEV INOTIFY_USER"

ERROR_INPUT_EVDEV="
Gizmo Daemon needs input evdev support from the kernel.
Please select \"Event interface\" (CONFIG_INPUT_EVDEV) under
\"Device Drivers->Input Device Support->Event interface\".
This option can be built directly into the kernel or as
a module.
"

ERROR_INOTIFY="
Gizmo Daemon needs inotify support built into the kernel.
Please select \"Inotify file change notifification\"
(CONFIG_INOTIFY) under \"Device Drivers->File systems\". This
option can only be built directly into the kernel.
"

ERROR_INOTIFY_USER="
Gizmo Daemon needs userspace inotify support built into the kernel.
Please select \"Inotify file change notifification\"
(CONFIG_INOTIFY) followed by \"Inotify support for userspace\"
(CONFIG_INOTIFY_USER) under \"Device Drivers->File systems\". These
options can only be built directly into the kernel.
"

src_unpack() {
	git-2_src_unpack
}

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	sed -i CMakeLists.txt -e /DefineInstallationPaths/d || die "sed: removal of DefineInstallationPaths failed"
	sed -i libGizmod/CMakeLists.txt -e 's:lib$:lib${LIB_SUFFIX}:' || die "sed: replacing lib with LIB_INSTALL_DIR failed"
}

src_configure() {
	local mycmakeargs="
		-DSYSCONF_INSTALL_DIR=${EPREFIX}/etc
		-DBOOST_PYTHON_LIBRARY=${EPREFIX}/usr/$(get_libdir)/libboost_python-${PYTHON_ABI}-mt.so
		$(cmake-utils_use_build libvisual VIS_PLUGIN)
	"
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	newinitd "${FILESDIR}/gizmod.rc" gizmod || die "init script install failed"
}
