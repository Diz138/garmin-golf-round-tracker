import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_endDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        return false; // No key handling needed on end screen for now
    }
}