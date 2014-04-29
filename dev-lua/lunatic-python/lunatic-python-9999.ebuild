# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lua/luasocket/luasocket-2.0.2.ebuild,v 1.1 2010/11/05 21:31:09 rafaelmartins Exp $

EAPI=2
PYTHON_DEPEND="2"

inherit git multilib toolchain-funcs flag-o-matic eutils

EGIT_REPO_URI="git://github.com/jtriley/Lunatic-Python.git"

DESCRIPTION="Two-way bridge between Lua and Python"
HOMEPAGE=""
SRC_URI=""

LICENSE="LGPL"
SLOT="0"
KEYWORDS=""
IUSE="debug"

RDEPEND=">=dev-lang/lua-5.1[deprecated]"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_compile() {
	append-flags -fPIC

	emake \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		CC="$(tc-getCC)" \
		LD="$(tc-getCC) -shared" \
		|| die
}

src_install() {
	INSTALL_TOP_SHARE="${D}/$(pkg-config --variable INSTALL_LMOD lua)"
	INSTALL_TOP_LIB="${D}/$(pkg-config --variable INSTALL_CMOD lua | sed -e "s:lib/:$(get_libdir)/:")"
	dodoc NEW README || die
	dohtml doc/* || die
}
