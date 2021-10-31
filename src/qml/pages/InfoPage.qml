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
import QtQuick.LocalStorage 2.0
import ".."

Page {
    SilicaFlickable {
        anchors.fill: parent
        bottomMargin: Theme.paddingLarge
        contentHeight: column.height

        PullDownMenu {
            MenuItem {
                text: "Tietoja"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }

            MenuItem {
                text: "Valinnat"
                onClicked: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }
        }

        Column {
            id: column

            spacing: Theme.paddingSmall
            width: parent.width

            PageHeader {
                title: "Palveluksesi"
            }

            Label {
                color: Theme.secondaryHighlightColor
                text: "Palvelukseenastumispäivä"
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.highlightColor
                text: tj.palvelukseenastumispaiva.toLocaleDateString()
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.secondaryHighlightColor
                text: "Kotiutumispäivä"
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.highlightColor
                text: tj.kotiutumispaiva.toLocaleDateString()
                horizontalAlignment: Text.AlignHCenter
                height: implicitHeight + Theme.paddingLarge
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
                text: "Tänään jäljellä"
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.highlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
                text: tj.tj + (tj.tj == 1 ? " aamu" : " aamua")
                height: implicitHeight + Theme.paddingLarge
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.secondaryHighlightColor
                text: "Palvelusta käyty"
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.highlightColor
                text: tj.kayty + (tj.kayty == 1 ? " vuorokausi" : " vuorokautta")
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.secondaryHighlightColor
                text: "Päivän pokemon"
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }

            Label {
                color: Theme.highlightColor
                text: tj.pokemoni ? tj.pokemoni : "Ei ole"
                horizontalAlignment: Text.AlignHCenter
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
            }
        }
    }

    TanaanJaljella {
        id: tj
    }
}
