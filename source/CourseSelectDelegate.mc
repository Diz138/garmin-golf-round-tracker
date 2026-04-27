import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class golf_round_courseSelectDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onPreviousPage() as Boolean {
        var model = getApp().model;
        if (model.courseIndex > 0) {
            model.courseIndex--;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onNextPage() as Boolean {
        var model = getApp().model;
        if (model.courseIndex < courseList.size() - 1) {
            model.courseIndex++;
            WatchUi.requestUpdate();
        }
        return true;
    }

    function onSelect() as Boolean {
        var model = getApp().model;
        model.selectCourse(courseList[model.courseIndex]);
        WatchUi.switchToView(
            new golf_round_holeSelectView(),
            new golf_round_holeSelectDelegate(),
            WatchUi.SLIDE_LEFT
        );
        return true;
    }

    function onBack() as Boolean {
        System.exit();
    }
}
