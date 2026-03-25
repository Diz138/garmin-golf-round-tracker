import Toybox.Graphics;
import Toybox.WatchUi;

class golf_round_endView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onUpdate(dc as Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;
        var model = getApp().model;

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Top banner
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_LT_GRAY);
        dc.fillRectangle(0, 0, width, height / 5);

        // "Round Complete" in banner
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            height / 8,
            Graphics.FONT_TINY,
            "Round Complete",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Course name or Free Play
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        var displayCourse = model.isFreePlay() ? "Free Play" : model.selectedCourse;
        dc.drawText(
            centerX,
            height * 3 / 10,
            Graphics.FONT_TINY,
            displayCourse,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Divider
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(width / 4, height * 2 / 5, width * 3 / 4, height * 2 / 5);

        // Holes played
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            height / 2,
            Graphics.FONT_SMALL,
            model.totalHoles + " Holes",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Total strokes
        dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            height * 3.5 / 5,
            Graphics.FONT_SMALL,
            model.totalStrokes.toString(),
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            height * 3 / 4,
            Graphics.FONT_TINY,
            "Total Strokes",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Score relative to par if course was selected
        if (!model.isFreePlay()) {
            var scoreToPar = model.getScoreToPar();
            var scoreLabel = "";
            if (scoreToPar == 0) {
                scoreLabel = "E";
            } else if (scoreToPar > 0) {
                scoreLabel = "+" + scoreToPar.toString();
            } else {
                scoreLabel = scoreToPar.toString();
            }

            if (scoreToPar < 0) {
                dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
            } else if (scoreToPar == 0) {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
            }

            dc.drawText(
                centerX,
                height * 9 / 10,
                Graphics.FONT_SMALL,
                scoreLabel + " vs Par",
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }
    }
}
