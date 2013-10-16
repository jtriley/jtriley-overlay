# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils flag-o-matic git-2

DESCRIPTION="Python bindings for zeromq."
HOMEPAGE="http://www.zeromq.org/bindings:python"
EGIT_REPO_URI="git://github.com/zeromq/${PN}.git"

IUSE="doc examples"
SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="LGPL-3"

DEPEND="dev-python/setuptools
		=net-libs/zeromq-9999"

src_prepare() {
	sed -e "s#library_dirs = .*#library_dirs = $(pkg-config --variable libdir libzmq)#" \
		-e "s#include_dirs = .*#include_dirs = $(pkg-config --variable includedir libzmq)#" \
		setup.cfg.template > setup.cfg || die
}

src_compile() {
	# Python 2 breaks strict aliasing. Don't use this flag with Python 3.
	append-flags -fno-strict-aliasing

	distutils_src_compile
}

src_install() {
	distutils_src_install
	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples || die
	fi
}
