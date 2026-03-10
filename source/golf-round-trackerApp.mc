import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class golf_round_trackerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [new golf_round_startView(), new golf_round_startDelegate()];
    }

}

function getApp() as golf_round_trackerApp {
    return Application.getApp() as golf_round_trackerApp;
}