import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_trackerDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();
        var model = getApp().model;

        if (key == WatchUi.KEY_UP) {
            model.incrementStroke();
            WatchUi.requestUpdate();
            return true;
        }

        if (key == WatchUi.KEY_DOWN) {
            model.decrementStroke();
            WatchUi.requestUpdate();
            return true;
        }

        if (key == WatchUi.KEY_ENTER) {
            if (model.confirmHole()) {
                WatchUi.switchToView(
                    new golf_round_endView(),
                    new golf_round_endDelegate(),
                    WatchUi.SLIDE_LEFT
                );
            } else {
                WatchUi.requestUpdate();
            }
            return true;
        }

        if (key == WatchUi.KEY_ESC) {
            if (model.previousHole()) {
                WatchUi.requestUpdate();
            } else {
                WatchUi.switchToView(
                    new golf_round_confirmResetView(),
                    new golf_round_confirmResetDelegate(),
                    WatchUi.SLIDE_RIGHT
                );
            }
            return true;
        }

        return false;
    }
}
