import QtQuick 2.0

Base {
    id: root

    Target {
        hits: 1
        x: 0
        y: 0
    }

    Target {
        hits: 2
        x: 60
        y: 60
    }

    Ammo {
        x: 200
        y: 200
    }
}
