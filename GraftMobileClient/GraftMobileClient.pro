QT += qml quick network

CONFIG += c++11

DEFINES += MAJOR_VERSION=1
DEFINES += MINOR_VERSION=6
DEFINES += BUILD_VERSION=3

win32|macx|unix {
DEFINES += RES_IOS

DESTDIR = ./bin
}

contains(DEFINES, POS_BUILD) {
TARGET = GraftPointOfSale
}
contains(DEFINES, WALLET_BUILD) {
TARGET = GraftWallet
}

ios {
include(ios/ios.pri)
}

android {
include(android/android.pri)
}

include(QZXing.pri)
include(QRCodeGenerator.pri)

contains(DEFINES, POS_BUILD) {
ios|android {
include(imagepicker/ImagePickerLibrary.pri)
}

SOURCES += \
    core/api/graftposapi.cpp \
    core/graftposclient.cpp

HEADERS += \
    core/api/graftposapi.h \
    core/graftposclient.h \
    core/defines.h
}

contains(DEFINES, WALLET_BUILD) {
SOURCES += \
    core/api/graftwalletapi.cpp \
    core/graftwalletclient.cpp

HEADERS += \
    core/api/graftwalletapi.h \
    core/graftwalletclient.h
}

win32 {
include(windows/windows.pri)
}

macx {
include(mac/mac.pri)
}

SOURCES += main.cpp \
    core/api/graftgenericapi.cpp \
    core/productmodel.cpp \
    core/productitem.cpp \
    core/productmodelserializator.cpp \
    core/graftbaseclient.cpp \
    core/barcodeimageprovider.cpp \
    core/carditem.cpp \
    core/cardmodel.cpp \
    core/keygenerator.cpp \
    core/selectedproductproxymodel.cpp \
    designfactory.cpp \
    core/currencymodel.cpp \
    core/currencyitem.cpp \
    core/accountitem.cpp \
    core/accountmodel.cpp \
    core/quickexchangeitem.cpp \
    core/quickexchangemodel.cpp \
    core/accountmodelserializator.cpp \
    core/accountmanager.cpp \
    core/qrcodegenerator.cpp \
    devicedetector.cpp

HEADERS += \
    core/config.h \
    core/api/graftgenericapi.h \
    core/productmodel.h \
    core/productitem.h \
    core/productmodelserializator.h \
    core/graftbaseclient.h \
    core/barcodeimageprovider.h \
    core/carditem.h \
    core/cardmodel.h \
    core/keygenerator.h \
    core/selectedproductproxymodel.h \
    designfactory.h \
    core/currencymodel.h \
    core/currencyitem.h \
    core/accountitem.h \
    core/accountmodel.h \
    core/quickexchangeitem.h \
    core/quickexchangemodel.h \
    core/accountmodelserializator.h \
    core/accountmanager.h \
    core/graftclienttools.h \
    core/qrcodegenerator.h \
    devicedetector.h

include(resources/resources.pri)

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
