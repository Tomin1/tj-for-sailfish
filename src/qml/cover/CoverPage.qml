/**
 * TJ for Sailfish
 * Copyright (c) 2014, 2021 Tomi Leppänen
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.1
import Sailfish.Silica 1.0
import ".."

CoverBackground {
    Label {
        id: label
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.verticalCenter
        }
        color: Theme.highlightColor
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeExtraLarge
        text: "Tänään\njäljellä"
    }

    Label {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: label.bottom
            topMargin: Theme.paddingLarge
        }
        color: Theme.secondaryHighlightColor
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeLarge
        text: tj.tj + (tj.tj === 1 ? " aamu" : " aamua")
    }

    TanaanJaljella {
        id: tj
    }
}
