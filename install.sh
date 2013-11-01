#!/bin/sh
#
#    Copyright 2007-2009 Canonical Ltd.
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

LIBFILES="usboot.py raw_write.py raw_format.py mountutils.py"
DATAFILES="usboot.glade"


if [ "$1" = "uninstall" ]; then
    rm -rf /usr/lib/usboot
    rm -rf /usr/share/usboot
    rm -r /usr/share/applications/usboot.desktop
    rm -r /usr/share/applications/usboot-kde.desktop
    rm -r /usr/share/applications/usboot-format.desktop
    rm -r /usr/share/applications/usboot-kde-format.desktop
    rm -f /usr/bin/usboot
    rm -rf /usr/share/polkit-1/actions/org.chitwanix.im.policy
    rm -rf /usr/share/kde4/apps/solid/actions/usboot-format.desktop
else
    cp share/applications/usboot.desktop /usr/share/applications/
    cp share/applications/usboot-format.desktop /usr/share/applications/
    cp share/applications/usboot-kde.desktop /usr/share/applications/
    cp share/applications/usboot-format-kde.desktop /usr/share/applications/
    cp share/polkit/org.chitwanix.im.policy /usr/share/polkit-1/actions
    cp share/kde4/usboot-format.desktop /usr/share/kde4/apps/solid/actions
    cp usboot /usr/bin/
    mkdir -p /usr/lib/usboot
    mkdir -p /usr/share/usboot

    for item in $LIBFILES; do
        cp lib/$item /usr/lib/usboot/
    done

    for item in $DATAFILES; do
        cp share/usboot/$item /usr/share/usboot/
    done
fi
