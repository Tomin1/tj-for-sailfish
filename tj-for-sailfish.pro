# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-tj-for-sailfish

CONFIG += sailfishapp

SOURCES += \
    src/tj-for-sailfish.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    qml/pages/FirstPage.qml \
    rpm/tj-for-sailfish.spec \
    rpm/tj-for-sailfish.yaml \
    qml/tj/script.js \
    qml/tj/settings.js \
    qml/pages/AboutPage.qml \
    qml/harbour-tj-for-sailfish.qml \
    harbour-tj-for-sailfish.desktop \
    rpm/harbour-tj-for-sailfish.yaml \
    rpm/harbour-tj-for-sailfish.spec

INSTALLS += target qml desktop icon

desktop.files = $${TARGET}.desktop
desktop.path = /usr/share/applications
