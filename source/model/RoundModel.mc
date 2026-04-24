import Toybox.Lang;

class RoundModel {

    // Course selection state
    var courseIndex as Number;
    var selectedCourse as String;
    var coursePars as Dictionary<Number, Number>;

    // Hole selection state
    var holeSelection as Number; // 0 = 9 holes, 1 = 18 holes
    var totalHoles as Number;

    // Round state
    var holeCounter as Number;
    var counter as Number;
    var totalStrokes as Number;
    var holeScores as Dictionary<Number, Number>;

    function initialize() {
        courseIndex = 0;
        selectedCourse = "";
        coursePars = {} as Dictionary<Number, Number>;
        holeSelection = 0;
        totalHoles = 0;
        holeCounter = 1;
        counter = 0;
        totalStrokes = 0;
        holeScores = {} as Dictionary<Number, Number>;
    }

    // Set the selected course and load its par data. Clears any previously loaded par data.
    function selectCourse(name as String) as Void {
        coursePars = {} as Dictionary<Number, Number>;
        selectedCourse = name;
        if (!name.equals("Free Play") && !name.equals("")) {
            var pars = getParsForCourse(name) as Array<Number>;
            for (var i = 0; i < pars.size(); i++) {
                coursePars.put(i, pars[i]);
            }
        }
    }

    // Apply holeSelection to set totalHoles and reset round counters
    function confirmHoleSelection() as Void {
        totalHoles = (holeSelection == 0) ? 9 : 18;
        holeScores = {} as Dictionary<Number, Number>;
        for (var i = 0; i < totalHoles; i++) {
            var par = coursePars.get(i);
            holeScores.put(i, (par != null) ? par as Number : 4);
        }
        var firstScore = holeScores.get(0);
        counter = (firstScore != null) ? firstScore as Number : 4;
    }

    // Increment the stroke counter for the current hole
    function incrementStroke() as Void {
        counter++;
        holeScores.put(holeCounter - 1, counter);
    }

    // Decrement the stroke counter for the current hole (not below 0)
    function decrementStroke() as Void {
        if (counter > 0) {
            counter--;
            holeScores.put(holeCounter - 1, counter);
        }
    }

    // Save current hole score and advance. Returns true if the round is complete.
    function confirmHole() as Boolean {
        holeScores.put(holeCounter - 1, counter);
        if (holeCounter < totalHoles) {
            holeCounter++;
            var nextScore = holeScores.get(holeCounter - 1);
            counter = (nextScore != null) ? nextScore as Number : 4;
            return false;
        }
        totalStrokes = 0;
        for (var i = 0; i < totalHoles; i++) {
            var score = holeScores.get(i);
            totalStrokes += (score != null) ? score as Number : 0;
        }
        return true;
    }

    // Save current hole score and go back one hole.
    // Returns true if navigation succeeded, false if already on hole 1.
    function previousHole() as Boolean {
        if (holeCounter <= 1) {
            return false;
        }
        holeScores.put(holeCounter - 1, counter);
        holeCounter--;
        var prevScore = holeScores.get(holeCounter - 1);
        counter = (prevScore != null) ? prevScore as Number : 0;
        return true;
    }

    // Calculate total par for the round based on selected course and holes played
    function getTotalPar() as Number {
        var totalPar = 0;
        for (var i = 0; i < totalHoles; i++) {
            var par = coursePars.get(i);
            if (par != null) {
                totalPar += par;
            }
        }
        return totalPar;
    }

    // Calculate score to par
    function getScoreToPar() as Number {
        return totalStrokes - getTotalPar();
    }

    // Determine if the current selection is Free Play (no course)
    function isFreePlay() as Boolean {
        return selectedCourse.equals("Free Play") || selectedCourse.equals("");
    }

    // Reset all state back to defaults (used when navigating back to course select)
    function reset() as Void {
        initialize();
    }

}
