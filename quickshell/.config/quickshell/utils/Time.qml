pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property var locale: Qt.locale()

    function createDate(): string {
        let date = new Date();
        let weekday = locale.dayName(date.getDay(), Locale.ShortFormat);
        let month = locale.monthName(date.getMonth(), Locale.ShortFormat);
        let day = date.getDate();

        return `${weekday} ${month} ${day}`;
    }

    function createTime(): string {
        let date = new Date();
        let hours = date.getHours();
        let minutes = date.getMinutes();
        let ampm = hours >= 12 ? "PM" : "AM";

        hours = hours % 12;
        hours = hours ? hours : 12; // hour 0 becomes 12
        let hh = hours.toString().padStart(2, '0');
        let mm = minutes.toString().padStart(2, '0');

        return `${hh}:${mm} ${ampm}`;
    }

    property var time: createTime()
    property var date: createDate()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            time = createTime();
            date = createDate();
        }
    }
}
