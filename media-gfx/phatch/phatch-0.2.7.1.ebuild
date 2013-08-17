# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $
EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1 fdo-mime versionator

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
	virtual/python-imaging
	sys-apps/findutils"

RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-fix-pil-imports.patch"
)

#src_compile(){
#	cd "${WORKDIR}/${PN}-${PHATCH_VERSION}"
#	distutils_src_compile
#}
