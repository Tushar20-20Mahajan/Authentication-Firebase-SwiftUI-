import SwiftUI

// RootView is the main view that handles authentication and navigation
struct RootView: View {
    @State private var showSignInView: Bool = false  // State variable to control the display of the sign-in view
    
    var body: some View {
        ZStack {
            // Navigation stack for managing navigation within the app
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)  // Display SettingsView and pass the binding of showSignInView
            }
        }
        .onAppear {
            // Check if the user is authenticated when the view appears
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            // Show the sign-in view if the user is not authenticated
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            // Display the AuthenticationView in a full-screen cover if showSignInView is true
            NavigationStack {
                AuthenticationView()
            }
        }
    }
}

// Preview provider for SwiftUI previews
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RootView()  // Preview the RootView within a NavigationStack
        }
    }
}


/*
 Description
 This SwiftUI code defines the RootView, which is the main view of the application. It handles the presentation of either the SettingsView or the AuthenticationView based on the user's authentication status.

 State Variable: showSignInView is a state variable that determines whether the sign-in view should be displayed.

 NavigationStack: Used to manage navigation within the app, allowing views to be pushed and popped from the navigation stack.

 onAppear Modifier: When RootView appears, it checks if the user is authenticated using the AuthenticationManager. If the user is not authenticated, it sets showSignInView to true, triggering the display of the sign-in view.

 fullScreenCover Modifier: Displays the AuthenticationView in a full-screen modal if showSignInView is true.

 SettingsView: The main content view of the app, which is displayed if the user is authenticated. It receives the showSignInView state binding to potentially update the authentication status.

 Preview Provider: Provides a preview of the RootView within a NavigationStack for the SwiftUI preview canvas.
 */
