import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"

MainView {
    id: main
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    
    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer.sarunekoo.shoot"

    width: units.gu(75)
    height: units.gu(100)

    property string colorBackground: "#f05a28"

    PageStack {
        Level1 {
            id: base
        }
    }
}
