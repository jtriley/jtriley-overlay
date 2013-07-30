# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2,3_3} )

inherit distutils-r1

MY_P="anthony_tuininga-cx_freeze-c435e2b3b7dd"
DESCRIPTION="A set of utilities for freezing Python scripts into executables"
HOMEPAGE="http://cx-freeze.sourceforge.net"
SRC_URI="https://bitbucket.org/anthony_tuininga/cx_freeze/get/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="PSF"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
S=${WORKDIR}/${MY_P}
