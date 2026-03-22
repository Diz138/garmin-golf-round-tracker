import Toybox.Graphics;
import Toybox.WatchUi;

class golf_round_trackerView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() as Void {}

    function onUpdate(dc as Dc) as Void {
        var model = getApp().model;

        View.onUpdate(dc);
        dc.clear();
        findDrawableById("hole").draw(dc);
        findDrawableById("ball").draw(dc);

        // Show course name if not free play
        if (!model.isFreePlay()) {
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
            dc.drawText(
                dc.getWidth() / 2,
                dc.getHeight() * 7 / 8,
                Graphics.FONT_TINY,
                model.selectedCourse,
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }

        // Hole counter
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2.5,
            dc.getHeight() / 6,
            Graphics.FONT_MEDIUM,
            model.holeCounter,
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );

        // Par for current hole if course selected
        if (!model.isFreePlay()) {
            var par = model.coursePars.get(model.holeCounter - 1);
            if (par != null) {
                dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
                dc.drawText(
                    dc.getWidth() / 7,
                    dc.getHeight() / 2,
                    Graphics.FONT_SMALL,
                    "Par: " + par.toString(),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
                );
            }
        }

        // Shot counter
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 1.75,
            dc.getHeight() / 2,
            Graphics.FONT_NUMBER_MEDIUM,
            model.counter.toString(),
            Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
        );
    }

    function onHide() as Void {}

}
