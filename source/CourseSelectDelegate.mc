import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class golf_round_courseSelectDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();
        var model = getApp().model;

        if (key == WatchUi.KEY_UP) {
            if (model.courseIndex > 0) {
                model.courseIndex--;
                WatchUi.requestUpdate();
            }
            return true;
        }

        if (key == WatchUi.KEY_DOWN) {
            if (model.courseIndex < courseList.size() - 1) {
                model.courseIndex++;
                WatchUi.requestUpdate();
            }
            return true;
        }

        if (key == WatchUi.KEY_ENTER) {
            model.selectCourse(courseList[model.courseIndex]);
            WatchUi.switchToView(
                new golf_round_holeSelectView(),
                new golf_round_holeSelectDelegate(),
                WatchUi.SLIDE_LEFT
            );
            return true;
        }

        if (key == WatchUi.KEY_ESC) {
            System.exit();
        }

        return false;
    }
}
