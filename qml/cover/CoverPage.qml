/**
 * TJ for Sailfish
 * Copyright (c) 2014, Tomi Leppänen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../tj/script.js" as TJ

CoverBackground {
    Label {
        id: label
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        color: Theme.primaryColor
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeExtraLarge
        text: "Tänään\njäljellä"
    }

    Label {
        id: tanaan_jaljella
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: label.bottom
        color: Theme.secondaryColor
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeLarge
        text: "\nN/A"
    }

    onStatusChanged: tanaan_jaljella.text = "\n" + TJ.get_tj_string()
}
