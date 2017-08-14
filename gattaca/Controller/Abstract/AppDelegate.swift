import UIKit
import Firebase

@UIApplicationMain
class AppDelegate:UIResponder, UIApplicationDelegate
{
    var window:UIWindow?
    
    func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        FirebaseApp.configure()
        
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        self.window = window
        
        let parent:ControllerParent = ControllerParent()
        window.rootViewController = parent
        
        return true
    }
}
