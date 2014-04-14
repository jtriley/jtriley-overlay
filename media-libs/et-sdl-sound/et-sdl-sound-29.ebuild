# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib games

DESCRIPTION="A library providing SDL sound for Enemy Territory, Quake3, and Return to Caste Wolfenstein"
HOMEPAGE="http://nullkey.kapsi.fi/et-sdl-sound"
SRC_URI="http://nullkey.kapsi.fi/${PN}/archive/${PN}-r${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libsdl
	amd64? ( app-emulation/emul-linux-x86-sdl )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}/${P}-adlerweb.patch"
}

src_compile() {
	use amd64 && multilib_toolchain_setup x86
	emake || die "emake failed"
}

src_install() {
	insinto /usr/$(get_libdir)
	doins "${WORKDIR}/${PN}/et-sdl-sound.so"
	dogamesbin "${FILESDIR}/et-sdl-sound"
}

pkg_postinst() {
	einfo 'To use sdl sound in any of the supported games,'
	einfo 'emerge it with USE="sdl", if available'
}
