import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_startDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();

        if (key == 13) { // Up - 9 holes
            totalHoles = 9;
            holeCounter = 1;
            counter = 0;
            WatchUi.switchToView(
                new golf_round_trackerView(),
                new golf_round_trackerDelegate(),
                WatchUi.SLIDE_LEFT
            );
            return true;
        }

        if (key == 8) { // Down - 18 holes
            totalHoles = 18;
            holeCounter = 1;
            counter = 0;
            WatchUi.switchToView(
                new golf_round_trackerView(),
                new golf_round_trackerDelegate(),
                WatchUi.SLIDE_LEFT
            );
            return true;
        }

        return false;
    }
}