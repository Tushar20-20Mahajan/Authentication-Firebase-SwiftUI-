
import SwiftUI

// ViewModel to manage settings-related actions
@MainActor
final class SettingsViewModel: ObservableObject {
    
    // Function to handle user sign-out
    func signOut() throws {
        try AuthenticationManager.shared.signOut()  // Call the signOut function from AuthenticationManager
    }
}

// View to display settings options, including sign-out
struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()  // StateObject to hold the ViewModel
    @Binding var showSignInView: Bool  // Binding to control the display of the sign-in view
    
    var body: some View {
        List {
            // Button to log out the user
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()  // Attempt to sign out the user
                        showSignInView = true  // Set showSignInView to true to show the sign-in view
                    } catch {
                        print(error)  // Print error if sign-out fails
                    }
                }
            }
        }
        .navigationTitle("Settings")  // Title of the navigation bar
    }
}

// Preview provider for SwiftUI previews
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSignInView: .constant(false))  // Preview the SettingsView with a constant binding
        }
    }
}

/*
 Description
 This SwiftUI code defines a view for settings options, including a button to sign out the user, and a ViewModel to manage the sign-out logic.

 SettingsViewModel:

 An ObservableObject class that manages actions related to settings.
 Contains a signOut function that attempts to sign out the user using the AuthenticationManager.
 SettingsView:

 A view that displays a list of settings options.
 Contains a Button that triggers the signOut function in the ViewModel when tapped.
 Uses a @StateObject to hold the SettingsViewModel instance.
 Uses a @Binding property to control the display of the sign-in view (showSignInView).
 Sets the navigation title to "Settings".
 Preview Provider:

 Provides a preview of the SettingsView within a NavigationStack for the SwiftUI preview canvas, allowing developers to see and interact with the view in Xcode's preview pane.
 Uses a constant binding for showSignInView to simulate the view in different states.
 */
