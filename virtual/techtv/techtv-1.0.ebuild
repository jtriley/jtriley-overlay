# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=4

DESCRIPTION="MIT TechTV Ruby on Rails app"
HOMEPAGE="http://techtv.mit.edu"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
app-misc/sphinx[mysql,odbc]
dev-db/redis
dev-db/mysql
"

RDEPEND="${DEPEND}"
