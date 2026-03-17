import Toybox.Graphics;
import Toybox.WatchUi;

var courseIndex = 0; // courseList is now generated in CourseData.mc

class golf_round_courseSelectView extends WatchUi.View {
    function initialize() {
        View.initialize();
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
            "Select Course",
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Divider line under title
        dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawLine(width / 4, height / 4, width * 3 / 4, height / 4);

        // Previous course hint (top, dimmed)
        if (courseIndex > 0) {
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                centerX,
                height * 3 / 10,
                Graphics.FONT_TINY,
                courseList[courseIndex - 1],
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }

        // Selected course - green highlight in the middle
        var selectedY = height / 2;
        dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_LT_GRAY);
        dc.fillRectangle(0, selectedY - 20, width, 40);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            centerX,
            selectedY,
            Graphics.FONT_SMALL,
            courseList[courseIndex],
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Next course hint (bottom, dimmed)
        if (courseIndex < courseList.size() - 1) {
            dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                centerX,
                height * 7 / 10,
                Graphics.FONT_TINY,
                courseList[courseIndex + 1],
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }
    }
}