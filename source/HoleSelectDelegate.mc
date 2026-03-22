import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_holeSelectDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();
        var model = getApp().model;

        if (key == WatchUi.KEY_UP || key == WatchUi.KEY_DOWN) {
            model.holeSelection = (model.holeSelection == 0) ? 1 : 0;
            WatchUi.requestUpdate();
            return true;
        }

        if (key == WatchUi.KEY_ENTER) {
            model.confirmHoleSelection();
            WatchUi.switchToView(
                new golf_round_trackerView(),
                new golf_round_trackerDelegate(),
                WatchUi.SLIDE_LEFT
            );
            return true;
        }

        if (key == WatchUi.KEY_ESC) {
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
