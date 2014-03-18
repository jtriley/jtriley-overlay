# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 multilib unpacker

DESCRIPTION="Fullscreen hack for Flash Plugin (Chrome and Firefox)"
HOMEPAGE="https://github.com/ali1234/fullscreenhack"
SLOT="live"
SRC_URI=""
EGIT_REPO_URI="https://github.com/ali1234/fullscreenhack.git"

LICENSE="unknown"
KEYWORDS=""
IUSE="+npapi +ppapi chrome-preload"
RESTRICT=""

RDEPEND="
	x11-libs/libX11
	x11-libs/libXinerama
	x11-libs/libXrandr
	chrome-preload? ( www-client/chromium )"
DEPEND="${RDEPEND}"

FSHACK_HOME=/opt/fullscreenhack
NPAPI_LIB="libfshack-npapi.so"
PPAPI_LIB="libfshack-ppapi.so"

src_unpack() {
	git-2_src_unpack
}

src_compile() {
	if use npapi; then
		emake ${NPAPI_LIB}
	fi
	if use ppapi; then
		emake ${PPAPI_LIB}
	fi
}

src_install() {
	insinto ${FSHACK_HOME}
    doins README
	insinto ${FSHACK_HOME}/$(get_libdir)/
	if use npapi; then
		doins ${NPAPI_LIB}
	fi
	if use ppapi; then
		doins ${PPAPI_LIB}
	fi
	if use chrome-preload; then
		mkdir chrome;
		echo "export LD_PRELOAD=${FSHACK_HOME}/$(get_libdir)/${PPAPI_LIB}" > chrome/fshack
		insinto /etc/chromium
		doins chrome/fshack
	fi
}
