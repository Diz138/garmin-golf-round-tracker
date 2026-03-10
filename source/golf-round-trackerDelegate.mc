import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

var counter = 0;
var holeCounter = 1;
var totalHoles = 18;
var totalStrokes = 0;

class golf_round_trackerDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();

        if (key == 13) { // Up - add shot
            counter++;
            WatchUi.requestUpdate();
            return true;
        }
        if (key == 8 && counter > 0) { // Down - remove shot
            counter--;
            WatchUi.requestUpdate();
            return true;
        }
        if (key == 4) { // Enter - next hole
            totalStrokes += counter; // Add current hole's strokes to total
            if (holeCounter < totalHoles) {
                holeCounter++;
                counter = 0;
                WatchUi.requestUpdate();
            } else {
                WatchUi.switchToView(
                    new golf_round_endView(),
                    new golf_round_endDelegate(),
                    WatchUi.SLIDE_LEFT
                );
            }
            return true;
        }
        return false;
    }
}