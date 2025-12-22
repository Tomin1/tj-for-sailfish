TEMPLATE = aux

TARGET = harbour-tj-for-sailfish

CONFIG += sailfishapp

OTHER_FILES += qml/*.qml \
    qml/cover/CoverPage.qml \
    qml/pages/*.qml \
    tj-for-sailfish.desktop \
    tj-for-sailfish.svg

ICON_SIZES = 86 108 128 172
ICON_SOURCE = $$PWD/tj-for-sailfish.svg
for (size, ICON_SIZES) {
    icon_dir = $$shadowed(icons/$${size}x$${size})
    icon_path = $${icon_dir}/$${TARGET}.png

    icon_$${size}.commands = mkdir -p $$icon_dir $$escape_expand(\n\t)
    icon_$${size}.commands += rsvg-convert --width=$${size} --height=$${size} \
            --output $$icon_path $$ICON_SOURCE $$escape_expand(\n\t)
    icon_$${size}.depends = $$ICON_SOURCE
    icon_$${size}.output = $$icon_path
    icon_$${size}.target = icon_$${size}

    icon_$${size}_install.CONFIG = no_check_exist
    icon_$${size}_install.depends = icon_$${size}
    icon_$${size}_install.files = $$icon_path
    icon_$${size}_install.path = /usr/share/icons/hicolor/$${size}x$${size}/apps

    QMAKE_EXTRA_TARGETS += icon_$${size}
    PRE_TARGETDEPS += icon_$${size}
    QMAKE_CLEAN += $$icon_path
    INSTALLS += icon_$${size}_install
}
