# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/boto/boto-2.9.8.ebuild,v 1.1 2013/07/21 09:05:17 radhermit Exp $

EAPI="5"
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_2,3_3} )
DISTUTILS_SRC_TEST="nosetests"

inherit distutils-r1

DESCRIPTION="Python utilites for manipulating IPv4 and IPv6 addresses"
HOMEPAGE="https://github.com/bd808/python-iptools http://pypi.python.org/pypi/iptools"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="doc"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

python_test() {
	nosetests || die -v tests || die
}

python_install_all() {
	distutils-r1_python_install_all
	# iptools doesnt package its sphinx Makefile, config, templates, etc.
	# for now install the single doc until the following PR gets merged and
	# released: https://github.com/bd808/python-iptools/pull/10
	use doc && dodoc docs/index.rst
}
