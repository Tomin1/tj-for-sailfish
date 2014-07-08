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

import QtQuick 2.1
import Sailfish.Silica 1.0

Dialog {
    id: about_page
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: about_column.height
        Column {
            id: about_column
            width: parent.width
            spacing: Theme.paddingSmall

            DialogHeader {
                title: "Tietoja sovelluksesta"
                acceptText: "Takaisin"
                cancelText: "Takaisin"
            }

            SectionHeader {
                text: "Kuvaus"
            }
            Label {
                id: label
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: "Tänään jäljellä sovellus SailfishOS:lle. \
Laskee jäljellä olevat varusmiespalveluksen aamut."
                width: parent.width - Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
            }

            SectionHeader {
                text: "Tekijänoikeudet ja lisensointi"
            }
            Text {
                id: text
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: "Tekijänoikeudet © Tomi Leppänen, 2014<br />
Lisenssi: GNU General Public License versio 3 tai uudempi versio"
                width: parent.width - Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
            }

            SectionHeader {
                text: "Lähdekoodi"
            }
            Label {
                id: link
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                text: "<style>a:link {color: " + Theme.highlightColor + ";}\
</style><a href=\"https://github.com/Tomin1/tj-for-sailfish\">\
https://github.com/Tomin1/tj-for-sailfish</a>"
                onLinkActivated: Qt.openUrlExternally(link)
                width: parent.width - Theme.paddingLarge * 2
                wrapMode: Text.WordWrap
            }
        }
    }
}
