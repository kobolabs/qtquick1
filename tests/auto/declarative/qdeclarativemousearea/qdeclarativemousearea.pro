CONFIG += testcase
TARGET = tst_qdeclarativemousearea

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 quick1-private widgets gui network
macx:CONFIG -= app_bundle

HEADERS += ../shared/testhttpserver.h
SOURCES += tst_qdeclarativemousearea.cpp ../shared/testhttpserver.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test
