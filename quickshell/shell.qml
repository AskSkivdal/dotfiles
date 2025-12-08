import Quickshell
import Quickshell.Io
import QtQuick
import "./singletons"

Scope {
    id: root

    property string time
    
    Variants {
      model: Quickshell.screens;
    
      delegate: Component {
        PanelWindow {
          // the screen from the screens list will be injected into this
          // property
          required property var modelData
    
          // we can then set the window's screen to the injected property
          screen: modelData
    
          anchors {
            top: true
            left: true
            right: true
          }
    
          implicitHeight: 32
    
          Text {
            font {
                pixelSize: 16
            }
            id: clock
            anchors.centerIn: parent
            text: Time.time
          }
        }
      }
    }
}