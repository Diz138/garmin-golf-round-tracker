import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

var counter = 0;
var holeCounter = 1;
var totalHoles = 18;
var totalStrokes = 0;
var holeScores = {} as Dictionary<Number, Number>;
var coursePars = {} as Dictionary<Number, Number>; // par for each hole, empty if free play
var selectedCourse = ""; // empty string means free play

class golf_round_trackerDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        var key = keyEvent.getKey();
        // System.println("Key pressed: " + key); 

        if (key == 13) { // Up - add shot
            counter++;
            holeScores.put(holeCounter - 1, counter);
            WatchUi.requestUpdate();
            return true;
        }

        if (key == 8 && counter > 0) { // Down - remove shot
            counter--;
            holeScores.put(holeCounter - 1, counter);
            WatchUi.requestUpdate();
            return true;
        }

        if (key == 4) { // Enter - next hole
            holeScores.put(holeCounter - 1, counter);
            if (holeCounter < totalHoles) {
                holeCounter++;
                counter = holeScores.get(holeCounter - 1) as Number;
                WatchUi.requestUpdate();
            } else {
                totalStrokes = 0;
                for (var i = 0; i < totalHoles; i++) {
                    totalStrokes += holeScores.get(i) as Number;
                }
                WatchUi.switchToView(
                    new golf_round_endView(),
                    new golf_round_endDelegate(),
                    WatchUi.SLIDE_LEFT
                );
            }
            return true;
        }

        if (key == 5 && holeCounter > 1) { // Back button - previous hole
            holeScores.put(holeCounter - 1, counter);
            holeCounter--;
            counter = holeScores.get(holeCounter - 1) as Number;
            WatchUi.requestUpdate();
            return true;
        }
        return false;
    }
}