import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_courseSelectDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();

        if (key == 13) { // Up - scroll up through courses
            if (courseIndex > 0) {
                courseIndex--;
                WatchUi.requestUpdate();
            }
            return true;
        }

        if (key == 8) { // Down - scroll down through courses
            if (courseIndex < courseList.size() - 1) {
                courseIndex++;
                WatchUi.requestUpdate();
            }
            return true;
        }

        if (key == 4) { // Enter - confirm selection
            selectedCourse = courseList[courseIndex];
            loadCourseData(); // Load pars if not free play
            WatchUi.switchToView(
                new golf_round_startView(),
                new golf_round_startDelegate(),
                WatchUi.SLIDE_LEFT
            );
            return true;
        }

        if (key == 5) { // Back - exit app
            System.exit();
        }
        

        return false;
    }

    // Load par data for the selected course into coursePars
    function loadCourseData() as Void {
        coursePars = {} as Dictionary<Number, Number>;
        if (selectedCourse.equals("Free Play")) {
            return;
        }
        var pars = getParsForCourse(selectedCourse) as Array<Number>;
            for (var i = 0; i < pars.size(); i++) {
                coursePars.put(i, pars[i]);
            }
    }

    function getParsForCourse(name as String) as Array<Number> {
        if (name.equals("Butternut Farm")) {
            return [4, 3, 4, 3, 4, 4, 5, 4, 5, 5, 3, 4, 3, 4, 4, 3, 4, 4] as Array<Number>;
        }
        if (name.equals("Pine Meadows")) {
            return [5, 3, 4, 5, 4, 3, 5, 4, 4, 5, 3, 4, 5, 4, 3, 5, 4, 4] as Array<Number>;
        }
        return [] as Array<Number>;
    }
}