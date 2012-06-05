# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/boto/boto-1.0a.ebuild,v 1.2 2008/01/18 03:05:35 mr_bones_ Exp $
EAPI="4"

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

IUSE=""
DESCRIPTION="Remember the Milk API in Python"
HOMEPAGE="http://code.google.com/p/rtmapi/"
SRC_URI="http://rtmapi.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/python-2.4"
