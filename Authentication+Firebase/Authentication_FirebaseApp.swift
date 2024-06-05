import SwiftUI
import FirebaseCore

// AppDelegate class to handle Firebase initialization
class AppDelegate: NSObject, UIApplicationDelegate {
  
  // Method called when the app has finished launching
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // Configure Firebase
    FirebaseApp.configure()
    return true
  }
}

@main
struct Authentication_FirebaseApp: App {
    
    // Register AppDelegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView() // RootView is the initial view of the app
            }
        }
    }
}


/*
 Description
 This SwiftUI code sets up a basic application integrated with Firebase. It includes the following components:

 AppDelegate Class: Handles Firebase initialization by conforming to UIApplicationDelegate. The application(_:didFinishLaunchingWithOptions:) method is overridden to configure Firebase when the app finishes launching.

 Authentication_FirebaseApp Struct: Defines the main entry point of the SwiftUI app. The @UIApplicationDelegateAdaptor property wrapper is used to register AppDelegate for handling Firebase setup.

 Scene and WindowGroup: The body property of the app defines the user interface. It uses a NavigationStack to manage the navigation between views, starting with RootView, which is the initial view of the app.
 */
