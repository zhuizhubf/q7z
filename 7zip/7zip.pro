QT = core
TARGET = 7z
TEMPLATE = lib

INCLUDEPATH += . ..
CONFIG += staticlib
DESTDIR = $$IFW_LIB_PATH

include(7zip.pri)
win32:include($$7ZIP_BASE/win.pri) #7zip
unix:include($$7ZIP_BASE/unix.pri) #p7zip


DESTDIR     = $$PWD/../bin
CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}

target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target
