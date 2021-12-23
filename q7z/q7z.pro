CONFIG -= debug_and_release debug_and_release_target
TEMPLATE = lib
INCLUDEPATH += . ..

#CONFIG += staticlib

include(../7zip/7zip.pri)

DEFINES += BUILD_LIB_Q7Z

QT = core
win32:QT += winextras

HEADERS += \
    q7z_create.h \
    q7z_errors.h \
    q7z_extract.h \
    q7z_facade.h \
    q7z_fileio.h \
    q7z_global.h \
    q7z_guid.h \
    q7z_list.h \
    q7z_range.h

SOURCES += \
    q7z_facade.cpp \
    q7z_fileio.cpp

CONFIG(debug, debug|release) {
    LIBS += -L$$PWD/../bin/ -l7zd
} else {
    LIBS += -L$$PWD/../bin/ -l7z
}

DESTDIR     = $$PWD/../bin
CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}

win32 {
    LIBS += -loleaut32 -luser32 -ladvapi32
    win32-g++*:LIBS += -lmpr -luuid
    win32-g++*:QMAKE_CXXFLAGS += -Wno-missing-field-initializers
}

macx {
    LIBS += -framework CoreFoundation
}
