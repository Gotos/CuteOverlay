# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit udev
inherit eutils

DESCRIPTION="A software used to capture Nintendo 3DS modded with a capture board by loopy"
HOMEPAGE="https://github.com/Gotos/Cute3DSCapture"
SRC_URI="http://alinas-chaos.de/files/cutecapture/cute3dscapture-${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="Unknown"
KEYWORDS="amd64 x86"

DEPEND="media-libs/libsfml
>=virtual/libusb-1"

RDEPEND="media-libs/libsfml
>=virtual/libusb-1"

S="${WORKDIR}/cute3dscapture-${PV}"

src_configure(){
    #./autogen.sh
    econf
}

src_install(){
    dobin Cute3DSCapture
    udev_dorules 95-3dscapture.rules
    doicon -s 64 Cute3DSCapture.png
    make_desktop_entry Cute3DSCapture Cute3DSCapture /usr/share/icons/hicolor/64x64/apps/Cute3DSCapture.png Game
}

pkg_postinst(){
    udev_reload
}

pkg_postrm(){
    udev_reload
}
