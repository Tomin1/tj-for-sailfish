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

Page {
    TanaanJaljella {
        id: tj
    }

    SilicaFlickable {
        anchors.fill: parent
        bottomMargin: Theme.paddingLarge
        contentHeight: column.height

        Column {
            id: column

            spacing: Theme.paddingSmall
            width: parent.width

            PageHeader {
                title: "Valinnat"
            }

            ComboBox {
                property bool ready
                label: "Vuosi"
                menu: ContextMenu {
                    Repeater {
                        model: tj.vuodet
                        MenuItem {
                            text: modelData
                        }
                    }
                }
                onCurrentIndexChanged: if (ready) tj.vuosi = value
                Component.onCompleted: {
                    if (tj.vuosi > tj.vuodet[0] && tj.vuosi < tj.vuodet[tj.vuodet.length - 1]) {
                        currentIndex = tj.vuosi - tj.vuodet[0]
                    }
                    ready = true
                }
            }

            ComboBox {
                property bool ready
                label: "Saapumiserä"
                menu: ContextMenu {
                    MenuItem {
                        text: "I"
                    }
                    MenuItem {
                        text: "II"
                    }
                }
                onCurrentIndexChanged: if (ready) tj.era = (value == "II") ? 2 : 1
                Component.onCompleted: {
                    if (tj.era == 1 || tj.era == 2) {
                        currentIndex = tj.era - 1
                    }
                    ready = true
                }
            }

            ComboBox {
                property bool ready
                label: "Palvelusaika"
                menu: ContextMenu {
                    Repeater {
                        model: tj.palvelusajat
                        MenuItem {
                            text: modelData
                        }
                    }
                }
                onCurrentIndexChanged: if (ready) tj.palvelusaika = value
                Component.onCompleted: {
                    switch (tj.palvelusaika.toString()) {
                        case "165":
                            currentIndex = 0
                            break
                        case "255":
                            currentIndex = 1
                            break
                        case "347":
                            currentIndex = 2
                            break
                        default:
                            console.log("Väärä arvo")
                            break
                    }
                    ready = true
                }
            }
        }
    }
}
