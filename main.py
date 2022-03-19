
import os, sys

from PySide2 import QtGui
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl
from PySide2.QtWidgets import QApplication

import resources


try:
    # Include in try/except block if you're also targeting Mac/Linux
    from PySide2.QtWinExtras import QtWin
    myappid = 'OplaEnergy.ColorPicker.1.0'
    QtWin.setCurrentProcessExplicitAppUserModelID(myappid)
except ImportError:
    pass

def run():

    app1=QApplication(sys.argv)  # NOTICE: QGuiApplication does not support QtChart!
    app1.setApplicationName("Color Picker 1.0")
    app1.setOrganizationName("")
    app1.setOrganizationDomain("")

    iconFile=os.path.join(os.path.dirname(__file__),"rcs/color_dropper.ico")
    if (os.path.exists(iconFile)):
        print("Icons located in Folder")
    else:
        iconFile=os.path.join(os.path.dirname(__file__),":/rcs/color_dropper.ico")
        print("Icons located in Binary")
    app1.setWindowIcon(QtGui.QIcon(iconFile))

    # QML Section
    #QProcessEnvironment.systemEnvironment().value("DEBUG") == "1"
    engine1=QQmlApplicationEngine()
    engine1.quit.connect(app1.quit)

    #setting the app theme: values: Default, Fusion, Imagine, Material, Universal
    # os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Default' #

    qmlFile = os.path.join(os.path.dirname(__file__),"resources/main.qml")
    if (os.path.exists(qmlFile)):
        print("Qmls located in Folder")
    else:
        print("Qmls located in Binary")
        qmlFile = os.path.join(os.path.dirname(__file__),":/resources/main.qml")

    engine1.load(qmlFile)


    if not engine1.rootObjects():
        sys.exit(False)
    sys.exit(app1.exec_())


if __name__ == '__main__':
    run()





