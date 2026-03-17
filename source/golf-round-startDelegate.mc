import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class golf_round_startDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();

        if (key == 13) { // Up - highlight 9 holes
            holeSelection = 0;
            WatchUi.requestUpdate();
            return true;
        }

        if (key == 8) { // Down - highlight 18 holes
            holeSelection = 1;
            WatchUi.requestUpdate();
            return true;
        }

        if (key == 4) { // Enter - confirm
            if (holeSelection == 0) {
                totalHoles = 9;
            } else {
                totalHoles = 18;
            }
            holeCounter = 1;
            counter = 0;
            WatchUi.switchToView(
                new golf_round_trackerView(),
                new golf_round_trackerDelegate(),
                WatchUi.SLIDE_LEFT
            );
            return true;
        }

        if (key == 5) { // Back - return to course selection
            holeSelection = 0;
            WatchUi.switchToView(
                new golf_round_courseSelectView(),
                new golf_round_courseSelectDelegate(),
                WatchUi.SLIDE_RIGHT
            );
            return true;
        }

        return false;
    }
}