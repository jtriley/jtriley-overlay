# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: dev-python/starcluster-0.93.3.ebuild 2011/04/19 jtriley

EAPI="4"

PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils bash-completion

MY_PN="StarCluster"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="StarCluster is a utility for creating and managing general purpose computing clusters hosted on Amazon's Elastic Compute Cloud (EC2)."
HOMEPAGE="http://web.mit.edu/star/cluster"
SRC_URI="http://pypi.python.org/packages/source/S/${MY_PN}/${MY_P}.tar.gz"
LICENSE="LGPL-3"
KEYWORDS="~amd64"
SLOT="0"

IUSE="doc bash-completion"

RDEPEND=">=dev-python/ssh-1.7.13
	>=dev-python/boto-2.3.0
	>=dev-python/jinja-2.6
	>=dev-python/decorator-3.1.1
	>=dev-python/pyasn1-0.0.13_beta
	>=dev-python/workerpool-0.9.2"

DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx )
	test? ( dev-python/nose )
	dev-python/setuptools"

S="${WORKDIR}/${MY_P}"

PYTHON_MODNAME="${PN}"

DOCS="docs/sphinx/*"

src_compile() {
	distutils_src_compile
	if use doc; then
		einfo "Generation of documentation"
		pushd docs/sphinx > /dev/null
		emake html || die "Generation of documentation failed"
		popd > /dev/null
	fi
}

src_install() {
	distutils_src_install --install-scripts="/usr/bin"
	dobashcompletion completion/${PN}-completion.sh ${PN}
	if use doc; then
		dohtml -A txt -r docs/sphinx/_build/html/*
	fi
}

pkg_postinst() {
	bash-completion_pkg_postinst
	distutils_pkg_postinst
}
