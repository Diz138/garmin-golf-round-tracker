import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class golf_round_saveRoundDelegate extends WatchUi.BehaviorDelegate {
    var view as golf_round_saveRoundView;

    function initialize(v as golf_round_saveRoundView) {
        BehaviorDelegate.initialize();
        view = v;
    }

    function onNextPage() as Boolean {
        view.selectedOption = (view.selectedOption == 0) ? 1 : 0;
        WatchUi.requestUpdate();
        return true;
    }

    function onPreviousPage() as Boolean {
        view.selectedOption = (view.selectedOption == 0) ? 1 : 0;
        WatchUi.requestUpdate();
        return true;
    }

    function onSelect() as Boolean {
        var model = getApp().model;
        if (view.selectedOption == 0) {
            if (model.session != null) {
                model.session.save();
                model.session = null;
            }
        }
        model.reset();
        System.exit();
    }

    function onBack() as Boolean {
        WatchUi.switchToView(
            new golf_round_endView(),
            new golf_round_endDelegate(),
            WatchUi.SLIDE_RIGHT
        );
        return true;
    }
}
