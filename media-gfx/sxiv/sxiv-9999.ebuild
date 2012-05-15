# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/sxiv/sxiv-1.0.ebuild,v 1.4 2012/04/23 20:25:56 mgorny Exp $

EAPI=4

inherit eutils savedconfig toolchain-funcs git-2

DESCRIPTION="Simple (or small or suckless) X Image Viewer"
HOMEPAGE="https://github.com/muennich/sxiv/"
EGIT_REPO_URI="http://github.com/muennich/${PN}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-libs/imlib2[X]
	x11-libs/libX11"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i -e "s:^\(\(C\|LD\)FLAGS\) =:\1 +=:" \
		-e "s:-O2::" Makefile || die

	restore_config config.h
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${ED}" PREFIX="${EPREFIX}"/usr install
	dodoc README.md

	save_config config.h
}
