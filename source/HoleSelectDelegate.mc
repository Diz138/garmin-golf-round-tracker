import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_holeSelectDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onNextPage() as Boolean {
        var model = getApp().model;
        model.holeSelection = (model.holeSelection == 0) ? 1 : 0;
        WatchUi.requestUpdate();
        return true;
    }

    function onPreviousPage() as Boolean {
        var model = getApp().model;
        model.holeSelection = (model.holeSelection == 0) ? 1 : 0;
        WatchUi.requestUpdate();
        return true;
    }

    function onSelect() as Boolean {
        var model = getApp().model;
        model.confirmHoleSelection();
        WatchUi.switchToView(
            new golf_round_trackerView(),
            new golf_round_trackerDelegate(),
            WatchUi.SLIDE_LEFT
        );
        return true;
    }

    function onBack() as Boolean {
        WatchUi.switchToView(
            new golf_round_courseSelectView(),
            new golf_round_courseSelectDelegate(),
            WatchUi.SLIDE_RIGHT
        );
        return true;
    }
}
