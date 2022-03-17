import QtQuick 2.7

import Common 1.0
import Linphone 1.0
import Linphone.Styles 1.0
import Utils 1.0

import App.Styles 1.0

// =============================================================================

Rectangle {
  color: HomeStyle.color

  // TODO: Remove me when smart tooltip will be available.
  Component {
    Item {
      property var i18n: [
        QT_TR_NOOP('showTooltips'),
        QT_TR_NOOP('howToDescription'),
        QT_TR_NOOP('howToTitle')
      ]
    }
  }

  ListView {
    anchors.horizontalCenter: parent.horizontalCenter
    boundsBehavior: Flickable.StopAtBounds
    clip: true
    orientation: ListView.Horizontal
    spacing: HomeStyle.spacing

    height: parent.height
    width: {
      var width = CardBlockStyle.width * count + (count - 1) * spacing
      return parent.width < width ? parent.width : width
    }

    model: ListModel {
      // TODO: Uncomment me when smart tooltip will be available.
      // ListElement {
      //   $component: 'checkBox'
      //   $componentText: qsTr('showTooltips')
      //   $description: qsTr('howToDescription')
      //   $icon: 'home_use_linphone'
      //   $title: qsTr('howToTitle')
      // }

    }

    delegate: CardBlock {
      anchors.verticalCenter: parent.verticalCenter

      description: $description.replace('%1', Utils.capitalizeFirstLetter(Qt.application.name))
      icon: $icon
      title: $title.replace('%1', Qt.application.name.toUpperCase())

      Loader {
        Component {
          id: button

          TextButtonB {
            text: $componentText
			colorNormal: $colorNormal
            onClicked: window.setView($view)
          }
        }

        Component {
          id: checkBox

          CheckBoxText {
            text: $componentText
          }
        }

        anchors.horizontalCenter: parent.horizontalCenter
        sourceComponent: $component === 'button' ? button : checkBox
      }
    }
  }
}
