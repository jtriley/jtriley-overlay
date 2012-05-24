# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $
EAPI="4"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils fdo-mime versionator

PHATCH_VERSION=$(get_version_component_range 1-3)

S=${WORKDIR}/${PN}-${PHATCH_VERSION}

DESCRIPTION="Phatch is a simple to use cross-platform GUI Photo Batch Processor"
HOMEPAGE="http://photobatch.stani.be/"
SRC_URI="http://photobatch.stani.be/download/package/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python
	dev-python/wxpython
	dev-python/imaging
	sys-apps/findutils"

RDEPEND="${DEPEND}"

#src_compile(){
#	cd "${WORKDIR}/${PN}-${PHATCH_VERSION}"
#	distutils_src_compile
#}
