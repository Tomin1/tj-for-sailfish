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
import "../tj/script.js" as TJ
import QtQuick.LocalStorage 2.0
import "../tj/settings.js" as Settings

Page {
    Component.onCompleted: {
        TJ.vuosi = Settings.get(LocalStorage, "vuosi");
        TJ.era = Settings.get(LocalStorage, "era");
        TJ.palvelusaika = Settings.get(LocalStorage, "palvelusaika");
    }
    onStatusChanged: {
        TJ.set_values(palvelukseenastumispaiva, kotiutumispaiva,
                      tanaan_jaljella, palvelusta_kayty, paivan_pokemon)
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu {
            MenuItem {
                text: "Tietoja"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }

            MenuItem {
                text: "Vaihda valintoja"
                onClicked: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }
        }

        Column {
            id: column
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingSmall
            width: parent.width

            PageHeader {
                title: "Tänään jäljellä"
            }

            Label {
                id: text_palvelukseenastumispaiva
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.primaryColor
                text: "Palvelukseenastumispäivä"
            }

            Label {
                id: palvelukseenastumispaiva
                property date value
                text: value !== null ? TJ.get_date_string(value) : "N/A"
                color: Theme.highlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: text_kotiutumispaiva
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.primaryColor
                text: "Kotitumispäivä"
            }

            Label {
                id: kotiutumispaiva
                property date value
                text: value !== null ? TJ.get_date_string(value) : "N/A"
                color: Theme.highlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: text_tanaan_jaljella
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeExtraLarge
                text: "Tänään jäljellä"
            }

            Label {
                id: tanaan_jaljella
                property int value
                text: (
                    value !== null ? value.toString() +
                                    (value != 1 ? " aamua" : " aamu") : "N/A"
                )
                font.pixelSize: Theme.fontSizeExtraLarge
                color: Theme.highlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: text_palvelusta_kayty
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.primaryColor
                text: "Palvelusta käyty"
            }

            Label {
                id: palvelusta_kayty
                property int value
                text: (
                    value !== null ? value.toString() +
                        (value != 1 ?  " vuorokautta" : "vuorokausi") : "N/A"
                )
                color: Theme.highlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label {
                id: text_paivan_pokemon
                anchors.horizontalCenter: parent.horizontalCenter
                color: Theme.primaryColor
                text: "Päivän pokemon"
            }

            Label {
                id: paivan_pokemon
                property string value
                text: value !== "N/A" ? value : "Ei ole"
                color: Theme.highlightColor
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
