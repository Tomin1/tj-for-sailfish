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
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu {
            MenuItem {
                text: "Tietoja"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
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

            ComboBox {
                id: vuosi
                label: "Vuosi"
                menu: ContextMenu {
                    MenuItem {
                        text: "2013"
                        property int value: 2013
                    }
                    MenuItem {
                        text: "2014"
                        property int value: 2014
                    }
                    MenuItem {
                        text: "2015"
                        property int value: 2015
                    }
                    MenuItem {
                        text: "2016"
                        property int value: 2016
                    }
                }
                onCurrentItemChanged: {
                    TJ.set_values(vuosi, era, palvelusaika,
                                  palvelukseenastumispaiva,  kotiutumispaiva,
                                  tanaan_jaljella, palvelusta_kayty);
                    if (vuosi.firstTimeSkipped)
                        Settings.set(LocalStorage, "vuosi",
                                 vuosi.currentIndex.toString());
                    else
                        vuosi.firstTimeSkipped = true;
                }
                property int defaultIndex: (new Date()).getFullYear() - 2013
                property bool firstTimeSkipped: false
            }

            ComboBox {
                id: era
                label: "Saapumiserä"
                menu: ContextMenu {
                    MenuItem {
                        text: "I"
                        property int value: 1
                    }
                    MenuItem {
                        text: "II"
                        property int value: 2
                    }
                }
                onCurrentItemChanged: {
                    TJ.set_values(vuosi, era, palvelusaika,
                                  palvelukseenastumispaiva, kotiutumispaiva,
                                  tanaan_jaljella, palvelusta_kayty);
                    if (era.firstTimeSkipped)
                        Settings.set(LocalStorage, "era",
                                     era.currentIndex.toString());
                    else
                        era.firstTimeSkipped = true;
                }
                property int defaultIndex: (new Date()).getMonth() < 6 ? 0 : 1
                property bool firstTimeSkipped: false
            }

            ComboBox {
                id: palvelusaika
                label: "Palvelusaika"
                menu: ContextMenu {
                    MenuItem {
                        text: "165"
                        property int value: 165
                    }
                    MenuItem {
                        text: "255"
                        property int value: 255
                    }
                    MenuItem {
                        text: "347"
                        property int value: 347
                    }
                }
                onCurrentItemChanged:  {
                    TJ.set_values(vuosi, era, palvelusaika,
                                  palvelukseenastumispaiva, kotiutumispaiva,
                                  tanaan_jaljella, palvelusta_kayty);
                    if (palvelusaika.firstTimeSkipped)
                        Settings.set(LocalStorage, "palvelusaika",
                                     palvelusaika.currentIndex.toString());
                    else
                        palvelusaika.firstTimeSkipped = true;
                }
                property int defaultIndex: 0
                property bool firstTimeSkipped: false
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
        }
    }

    Component.onCompleted: {
        Settings.init(LocalStorage);
        if (Settings.get(LocalStorage, "vuosi") !== false)
            vuosi.currentIndex = parseInt(Settings.get(LocalStorage, "vuosi"));
        else
            vuosi.currentIndex = vuosi.defaultIndex;
        if (Settings.get(LocalStorage, "era") !== false)
            era.currentIndex = parseInt(Settings.get(LocalStorage, "era"));
        else
            era.currentIndex = era.defaultIndex;
        if (Settings.get(LocalStorage, "palvelusaika") !== false)
            palvelusaika.currentIndex = parseInt(Settings.get(
                        LocalStorage, "palvelusaika"));
        else
            palvelusaika.currentIndex = palvelusaika.defaultIndex;
        TJ.set_values(vuosi, era, palvelusaika, palvelukseenastumispaiva,
                      kotiutumispaiva, tanaan_jaljella, palvelusta_kayty);
    }
}
