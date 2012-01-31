# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

#That crazy "b" is not allowed :(
MY_P="cx_Freeze-4.0b1"
#Other desc: create standalone executables from Python scripts
DESCRIPTION="A set of utilities for freezing Python scripts into executables"
HOMEPAGE="http://www.cxtools.net/default.aspx?nav=cxfrlb"
SRC_URI="http://surfnet.dl.sourceforge.net/sourceforge/cx-freeze/${MY_P}.tar.gz"
LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
#DEPEND=""
#RDEPEND=""
S=${WORKDIR}/${MY_P}

src_install(){
	distutils_src_install
}

