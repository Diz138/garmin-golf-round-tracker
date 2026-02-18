import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_trackerDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new golf_round_trackerMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}