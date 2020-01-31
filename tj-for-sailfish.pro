TEMPLATE = subdirs
SUBDIRS = src

copying.files = COPYING
copying.path = /usr/share/harbour-tj-for-sailfish/

INSTALLS += copying

OTHER_FILES += rpm/tj-for-sailfish.spec
