CONFIG += testcase
TARGET = tst_qdeclarativeinfo

QT += testlib
contains(QT_CONFIG,quick1): QT += quick1 widgets
macx:CONFIG -= app_bundle

SOURCES += tst_qdeclarativeinfo.cpp

symbian: {
    importFiles.files = data
    importFiles.path = .
    DEPLOYMENT += importFiles
} else {
    DEFINES += SRCDIR=\\\"$$PWD\\\"
}

CONFIG += parallel_test
