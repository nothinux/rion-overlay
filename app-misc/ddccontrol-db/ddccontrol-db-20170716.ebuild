# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="DDCControl monitor database"
HOMEPAGE="http://ddccontrol.sourceforge.net/"
SRC_URI="https://github.com/ddccontrol/ddccontrol-db/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="nls"

RDEPEND="nls? ( sys-devel/gettext )"
DEPEND="${RDEPEND}
		dev-util/intltool
		dev-perl/XML-Parser"

DOCS=( AUTHORS ChangeLog NEWS README.md )

src_prepare(){
	touch db/options.xml.h ABOUT-NLS config.rpath || die
	eapply_user
	eautoreconf
}

src_configure() {
	econf $(use_enable nls)
}
