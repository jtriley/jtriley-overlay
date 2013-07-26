# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: dev-python/starcluster-0.9999.ebuild 2012/04/19 jtriley

EAPI="4"

inherit git-2

DESCRIPTION=""
HOMEPAGE="http://docker.io"
EGIT_REPO_URI="https://github.com/dotcloud/${PN}.git"
EGIT_BRANCH="master"
LICENSE="Apache-2.0"
KEYWORDS=""
SLOT="0"

IUSE=""

RDEPEND="dev-lang/go
	app-emulation/lxc
	net-misc/wget
	net-misc/curl"

DEPEND="${RDEPEND}"
