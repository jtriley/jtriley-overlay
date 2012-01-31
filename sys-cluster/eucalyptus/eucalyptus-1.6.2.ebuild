# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=2

DESCRIPTION="Eucalyptus is an open source software framework for cloud computing that implements what is commonly referred to as Infrastructure as a Service (IaaS)."
HOMEPAGE="http://open.eucalyptus.com"
#SRC_URI="http://open.eucalyptus.com/sites/all/modules/pubdlcnt/pubdlcnt.php?file=http://eucalyptussoftware.com/downloads/releases/${P}-src.tar.gz"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
virtual/jdk:1.6
dev-java/ant-core
www-servers/apache
app-emulation/libvirt
net-firewall/iptables
net-misc/vconfig
net-misc/bridge-utils
sys-fs/lvm2
sys-block/vblade
net-misc/curl
net-dns/dnsmasq
sys-block/aoetools
sys-block/parted
"

RDEPEND="${DEPEND}"
