import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_endDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onSelect() as Boolean {
        var saveView = new golf_round_saveRoundView();
        WatchUi.switchToView(
            saveView,
            new golf_round_saveRoundDelegate(saveView),
            WatchUi.SLIDE_LEFT
        );
        return true;
    }
}