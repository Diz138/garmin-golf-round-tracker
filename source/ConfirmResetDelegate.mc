import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_confirmResetDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();

        if (key == WatchUi.KEY_ENTER) {
            getApp().model.reset();
            WatchUi.switchToView(
                new golf_round_courseSelectView(),
                new golf_round_courseSelectDelegate(),
                WatchUi.SLIDE_RIGHT
            );
            return true;
        }

        if (key == WatchUi.KEY_DOWN || key == WatchUi.KEY_ESC) {
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
