import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_saveRoundView extends WatchUi.View {
    var selectedOption as Number; // 0 = Save, 1 = Discard

    function initialize() {
        View.initialize();
        selectedOption = 0;
    }

    function onUpdate(dc as Dc) as Void {
        var width = dc.getWidth();
        var height = dc.getHeight();
        var centerX = width / 2;

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

        // Title
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            height / 6,
            Graphics.FONT_SMALL,
            "Save Round?",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Divider line under title
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(width / 4, height / 4, width * 3 / 4, height / 4);

        // Dimmed hint above (only when Discard is selected)
        if (selectedOption == 1) {
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                centerX,
                height * 3 / 10,
                Graphics.FONT_TINY,
                "Save",
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }

        // Selected option — highlighted in center
        var selectedY = height / 2;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_LT_GRAY);
        dc.fillRectangle(0, selectedY - 20, width, 40);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            selectedY,
            Graphics.FONT_SMALL,
            selectedOption == 0 ? "Save" : "Discard",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Dimmed hint below (only when Save is selected)
        if (selectedOption == 0) {
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                centerX,
                height * 7 / 10,
                Graphics.FONT_TINY,
                "Discard",
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }
    }
}
