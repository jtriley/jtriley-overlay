# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/hipchat/hipchat-2.2.1163.ebuild $

EAPI="5"

inherit eutils pax-utils unpacker

DESCRIPTION="Group chat and video chat built for teams"
HOMEPAGE="http://hipchat.com"
SRC_URI="
		amd64? (
				http://downloads.hipchat.com/linux/arch/x86_64/hipchat-${PV}-x86_64.pkg.tar.xz
		)
		x86?   (
				http://downloads.hipchat.com/linux/arch/i686/hipchat-${PV}-i686.pkg.tar.xz
		)
"
RESTRICT="mirror"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	sed -i -e 's/Icon=hipchat.png/Icon=hipchat/' usr/share/applications/hipchat.desktop || die "sed failed"
	sed -i -e 's/Terminal=0/Terminal=false/' usr/share/applications/hipchat.desktop || die "sed failed"
}

src_install () {
	foo=""
	insinto $foo/usr
	doins -r usr/share

	insinto $foo/opt/HipChat/
	exeinto $foo/opt/HipChat/bin
	doins -r opt/HipChat/share
	doins -r opt/HipChat/lib
	doexe  opt/HipChat/bin/*
	dosym $foo/opt/HipChat/bin/hipchat $foo/usr/local/bin/hipchat
	fperms 0755 $foo/opt/HipChat/lib/hipchat.bin
}
