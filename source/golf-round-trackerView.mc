import Toybox.Graphics;
import Toybox.WatchUi;

var _ball;
var _background;

class golf_round_trackerView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
        _ball = findDrawableById("ball");
        _background = findDrawableById("hole");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        dc.clear();
        _background.draw(dc);
        _ball.draw(dc);

        // Show course name if not free play
        if (!selectedCourse.equals("Free Play") && !selectedCourse.equals("")) {
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                dc.getWidth() / 2,
                dc.getHeight() * 7/8,
                Graphics.FONT_TINY,
                selectedCourse,
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }

        // Hole counter
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2.5,
            dc.getHeight() / 6,
            Graphics.FONT_MEDIUM,
            holeCounter,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Par for current hole if course selected
        if (coursePars.size() > 0) {
            if (coursePars.size() > 0) {
                var par = coursePars.get(holeCounter - 1);
                if (par != null) {
                    dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
                    dc.drawText(
                        dc.getWidth() / 7,
                        dc.getHeight() / 2,
                        Graphics.FONT_SMALL,
                        "Par: " + (par).toString(),
                        Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
                    );
                }
            }
        }

        // Shot counter
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 1.75,
            dc.getHeight() / 2,
            Graphics.FONT_NUMBER_MEDIUM,
            counter.toString(),
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
