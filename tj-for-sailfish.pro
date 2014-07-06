# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = tj-for-sailfish

CONFIG += sailfishapp

SOURCES += src/tj-for-sailfish.cpp

OTHER_FILES += qml/tj-for-sailfish.qml \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/tj-for-sailfish.spec \
    rpm/tj-for-sailfish.yaml \
    tj-for-sailfish.desktop \
    qml/tj/script.js \
    qml/tj/settings.js

