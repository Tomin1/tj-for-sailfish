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

Page {
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        bottomMargin: Theme.paddingLarge

        Column {
            id: column
            width: parent.width
            spacing: Theme.paddingSmall

            PageHeader {
                title: "Tietoja sovelluksesta"
            }

            SectionHeader {
                text: "Kuvaus"
            }

            Label {
                color: Theme.secondaryHighlightColor
                text: "Aamukampasovellus Sailfish-käyttöjärjestelmälle. \
Laskee jäljellä olevat varusmiespalveluksen aamut."
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
                wrapMode: Text.Wrap
            }

            SectionHeader {
                text: "Kehitys"
            }

            Label {
                color: Theme.secondaryHighlightColor
                linkColor: Theme.primaryColor
                font.pixelSize: Theme.fontSizeSmall
                text: "Kehittäjä: <a href=\"https://github.com/Tomin1\">Tomi Leppänen</a><br />
Lisenssi: <a href=\"#\">GNU General Public License versio 3</a><br />
Lähdekoodi: <a href=\"https://github.com/Tomin1/tj-for-sailfish\">github.com/Tomin1/tj-for-sailfish</a>"
                textFormat: Text.StyledText
                x: Theme.horizontalPageMargin
                width: parent.width - 2 * x
                wrapMode: Text.Wrap

                onLinkActivated: {
                    if (link == "#") {
                        pageStack.push(licensePage, {
                            "contentFile": Qt.resolvedUrl("../../COPYING")
                        })
                    } else {
                        Qt.openUrlExternally(link)
                    }
                }
            }
        }
    }

    Component {
        id: licensePage

        Page {
            property url contentFile

            allowedOrientations: Orientation.All

            function load() {
                var xhr = new XMLHttpRequest
                xhr.open("GET", contentFile)
                xhr.onreadystatechange = function() {
                    if (xhr.readyState == XMLHttpRequest.DONE) {
                        content.text = xhr.responseText
                    }
                }
                xhr.send()
            }

            onStatusChanged: if (status == PageStatus.Active) load()

            BusyIndicator {
                anchors.centerIn: parent
                running: content.text === ""
                size: BusyIndicatorSize.Large
            }

            SilicaFlickable {
                anchors.fill: parent
                contentHeight: authorsContent.height

                Column {
                    id: authorsContent
                    width: parent.width

                    PageHeader {
                        title: "GNU GPLv3"
                        description: "GNU General Public License version 3"
                    }

                    Label {
                        id: content
                        color: Theme.highlightColor
                        font.pixelSize: Theme.fontSizeSmall
                        wrapMode: Text.Wrap
                        x: Theme.horizontalPageMargin
                        width: parent.width - 2 * x
                        opacity: content.text !== "" ? 1.0 : 0.0
                        Behavior on opacity {
                            FadeAnimator {
                                duration: 500
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }

                VerticalScrollDecorator { }
            }
        }
    }
}
