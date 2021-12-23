QT = core
TARGET = 7z
TEMPLATE = lib

INCLUDEPATH += . ..
CONFIG += staticlib
DESTDIR = $$IFW_LIB_PATH

include(7zip.pri)
win32:include($$7ZIP_BASE/win.pri) #7zip
unix:include($$7ZIP_BASE/unix.pri) #p7zip


#输出目录
DESTDIR     = $$PWD/../bin
#debug 在输出文件添加 d  -> xxd.lib xxd.dll xxd.exe
build_pass:CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}


target.path = $$[QT_INSTALL_LIBS]
INSTALLS += target
