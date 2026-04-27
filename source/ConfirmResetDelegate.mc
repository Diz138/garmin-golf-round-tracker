import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_confirmResetDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() as Boolean {
        getApp().model.reset();
        WatchUi.switchToView(
            new golf_round_courseSelectView(),
            new golf_round_courseSelectDelegate(),
            WatchUi.SLIDE_RIGHT
        );
        return true;
    }

    function onBack() as Boolean {
        WatchUi.switchToView(
            new golf_round_trackerView(),
            new golf_round_trackerDelegate(),
            WatchUi.SLIDE_LEFT
        );
        return true;
    }

    function onNextPage() as Boolean {
        return onBack();
    }
}
