# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Spotify is a social music platform"
HOMEPAGE="https://www.spotify.com/ch-de/download/previews/"

MY_PV="${PV}.gbd39032.58-1"
MY_P="${PN}-client-qt_${MY_PV}"
SRC_BASE="http://repository.spotify.com/pool/non-free/${PN:0:1}/${PN}/"
SRC_URI="
	x86?   ( ${SRC_BASE}${MY_P}_i386.deb )
	amd64? ( ${SRC_BASE}${MY_P}_amd64.deb )
	"
LICENSE="Spotify"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-devel/binutils
		app-arch/tar"
RDEPEND="${DEPEND}
		x11-libs/libX11
		x11-libs/libSM
		x11-libs/libICE
		x11-libs/libXrender
		x11-libs/libXrandr
		x11-libs/libXinerama
		x11-libs/libXext
		x11-libs/libxcb
		x11-libs/libXau
		x11-libs/libXdmcp
		x11-libs/qt-core:4
		x11-libs/qt-gui:4
		x11-libs/qt-webkit:4
		x11-libs/qt-dbus:4
		x11-libs/libXScrnSaver
		media-libs/freetype
		media-libs/fontconfig
		media-libs/alsa-lib
		media-libs/phonon
		dev-libs/openssl
		dev-libs/glib:2
		>media-libs/libpng-1.5
		dev-db/sqlite:3
		sys-libs/zlib
		app-arch/bzip2
		sys-apps/dbus
		sys-apps/util-linux
		dev-libs/expat"

RESTRICT="mirror strip"

src_unpack() {
	mkdir "${P}"
	cd "${P}"
	unpack "${A}"
	unpack ./data.tar.gz
}

src_install() {
	dodoc usr/share/doc/spotify-client-qt/changelog.Debian.gz
	dodoc usr/share/doc/spotify-client-qt/copyright
	insinto /usr/share/applications
	doins usr/share/applications/*.desktop
	insinto /usr/share/pixmaps
	doins usr/share/pixmaps/*.png
	dodir /usr/share/spotify
	insinto /usr/share/spotify
	doins -r usr/share/spotify/*

	# install the binary in /opt/spotify
	declare SPOTIFY_HOME=/opt/spotify
	dodir ${SPOTIFY_HOME}
	insinto ${SPOTIFY_HOME}
	doins usr/bin/spotify

	# Create /usr/bin/spotify wrapper
	dodir /usr/bin/
	cat <<-EOF >"${D}"/usr/bin/${PN}
	#!/bin/sh
	exec $SPOTIFY_HOME/spotify "\$@"
	EOF
	fperms 0755 /usr/bin/${PN}
	fperms 0755 $SPOTIFY_HOME/${PN}

	dodir /etc/revdep-rebuild
	# create revdep-rebuild entry for spotify_home
	cat <<-EOF >"${D}"/etc/revdep-rebuild/10"${PN}"
	SEARCH_DIRS_MASK="/opt/spotify"
	EOF
}
