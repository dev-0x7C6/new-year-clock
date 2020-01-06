import QtQuick 2.14
import QtQuick.Controls 2.14
import QtMultimedia 5.14
import QtQuick.Layouts 1.14

ApplicationWindow {
    visible: true
    width: 1280
    height: 800
    title: qsTr("NewYearCounter")
    color: "black"

    MediaPlayer {
        id: player
        source: "file:///home/dev/fireworks.mkv"
        autoPlay: true
        loops: MediaPlayer.Infinite
        volume: 0
    }

    VideoOutput {
        id: videoOutput
        source: player
        anchors.fill: parent
        fillMode: VideoOutput.Stretch
        opacity: 0.8
        Behavior on opacity { NumberAnimation { duration: 100 } }
    }

    MouseArea {
        anchors.fill: parent
        onWheel: {
            if (wheel.angleDelta.y < 0)
                videoOutput.opacity -=  0.1;
            if (wheel.angleDelta.y > 0)
                videoOutput.opacity +=  0.1;
        }
    }

    Timer {
        interval: 100;
        running: true;
        repeat: true;

        onTriggered: {
            var date = new Date;
            h0.source = "resources/lamp_0" + parseInt(date.getHours() / 10) + ".png"
            h1.source = "resources/lamp_0" + parseInt(date.getHours() % 10) + ".png"
            m0.source = "resources/lamp_0" + parseInt(date.getMinutes() / 10) + ".png"
            m1.source = "resources/lamp_0" + parseInt(date.getMinutes() % 10) + ".png"
            s0.source = "resources/lamp_0" + parseInt(date.getSeconds() / 10) + ".png"
            s1.source = "resources/lamp_0" + parseInt(date.getSeconds() % 10) + ".png"

            var year = date.getFullYear()
            y3.source = "resources/lamp_0" + parseInt(year % 10) + ".png"
            y2.source = "resources/lamp_0" + parseInt((year = parseInt(year / 10)) % 10) + ".png"
            y1.source = "resources/lamp_0" + parseInt((year = parseInt(year / 10)) % 10) + ".png"
            y0.source = "resources/lamp_0" + parseInt((year = parseInt(year / 10)) % 10) + ".png"

            sep1.opacity = date.getSeconds() % 2 === 0 ? 1.0 : 0.0
            sep2.opacity = date.getSeconds() % 2 === 0 ? 1.0 : 0.0
        }
    }

    SwipeView {
        id: view
        anchors.fill: parent
        currentIndex: 0

        Item {
            RowLayout {
                anchors.fill: parent

                Image {
                    id: h0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: h1
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: sep1
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    source: "qrc:/resources/lamp_sep.png"
                    fillMode: Image.PreserveAspectFit
                    Behavior on opacity { NumberAnimation { duration: 400 } }
                }


                Image {
                    id: m0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: m1
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: sep2
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    source: "qrc:/resources/lamp_sep.png"
                    fillMode: Image.PreserveAspectFit
                    Behavior on opacity { NumberAnimation { duration: 400 } }
                }

                Image {
                    id: s0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: s1
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        Item {
            RowLayout {
                anchors.fill: parent

                Image {
                    id: y0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: y1
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: y2
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }

                Image {
                    id: y3
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
