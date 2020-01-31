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

Dialog {
    onAccepted: {
        TJ.vuosi = parseInt(vuosi_chooser.currentItem.value);
        Settings.set(LocalStorage, "vuosi", vuosi_chooser.currentItem.value);
        TJ.era = parseInt(era_chooser.currentItem.value);
        Settings.set(LocalStorage, "era", era_chooser.currentItem.value);
        TJ.palvelusaika = parseInt(palvelusaika_chooser.currentItem.value);
        Settings.set(LocalStorage, "palvelusaika",
                     palvelusaika_chooser.currentItem.value
        );
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        Column {
            id: column
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingSmall
            width: parent.width

            DialogHeader {
                title: "Tänään jäljellä"
                acceptText: "Aseta"
                cancelText: "Peru"
            }

            ComboBox {
                id: vuosi_chooser
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
                function indexFromValue(value) {
                    if (value > 2013 && value < 2016)
                        return value - 2013;
                    return 0;
                }
            }

            ComboBox {
                id: era_chooser
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
                function indexFromValue(value) {
                    if (value === 1 || value === 2)
                        return value-1;
                    return 0;
                }
            }

            ComboBox {
                id: palvelusaika_chooser
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
                function indexFromValue(value) {
                    switch(value) {
                        case 165:
                            return 0;
                        case 255:
                            return 1;
                        case 347:
                            return 2;
                        default:
                            return 0;
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        vuosi_chooser.currentIndex = vuosi_chooser.indexFromValue(TJ.vuosi);
        era_chooser.currentIndex = era_chooser.indexFromValue(TJ.era);
        palvelusaika_chooser.currentIndex = palvelusaika_chooser.indexFromValue(
                    TJ.palvelusaika
        );
    }
}
