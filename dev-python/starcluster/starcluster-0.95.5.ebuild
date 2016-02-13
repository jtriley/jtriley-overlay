# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: dev-python/starcluster-0.95.5.ebuild 2014/03/20 jtriley

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 bash-completion-r1

MY_PN="StarCluster"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="StarCluster is a Cluster Computing Toolkit for the Cloud (EC2)."
HOMEPAGE="http://star.mit.edu/cluster"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="LGPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc bash-completion epydoc test"

RDEPEND=">=dev-python/paramiko-1.12.1[${PYTHON_USEDEP}]
	>=dev-python/boto-2.23.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7[${PYTHON_USEDEP}]
	>=dev-python/decorator-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/workerpool-0.9.2[${PYTHON_USEDEP}]
	>=dev-python/iptools-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/iso8601-0.1.8[${PYTHON_USEDEP}]
	>=dev-python/pycrypto-2.5[${PYTHON_USEDEP}]
	>=dev-python/scp-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/optcomplete-1.2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
    test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/sphinxcontrib-issuetracker[${PYTHON_USEDEP}]
	dev-python/epydoc[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

python_compile_all() {
	use doc && emake -C docs/sphinx html
	mkdocs() {
		local exit_status=0
		local msg="build with epydoc failed"
		pushd docs/epydoc/
		PATH=$PATH:./ PYTHONPATH="${BUILD_DIR}/lib" ./build.sh || exit_status=1
		[[ $exit_status != 0 ]] && eerror "$msg"
		popd sets
		return $exit_status
	}
	use epydoc && mkdocs
}

python_install_all() {
	distutils-r1_python_install_all
	use bash-completion && newbashcomp completion/${PN}-completion.sh ${PN}
	use doc && local HTML_DOCS=( docs/sphinx/_build/html/. )
	if use epydoc; then
		docompress -x usr/share/doc/${PF}/apidocs/api-objects.txt
		insinto usr/share/doc/${PF}/
		doins -r "${S}"/docs/apidocs/
	fi
}

python_test() {
	py.test || die -v ${PN}/tests || die
}
