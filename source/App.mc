import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_trackerApp extends Application.AppBase {

    var model as RoundModel;

    function initialize() {
        AppBase.initialize();
        model = new RoundModel();
    }

    function onStart(state as Dictionary?) as Void {}

    function onStop(state as Dictionary?) as Void {}

    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [new golf_round_courseSelectView(), new golf_round_courseSelectDelegate()];
    }

}

function getApp() as golf_round_trackerApp {
    return Application.getApp() as golf_round_trackerApp;
}