import SwiftUI

// View for user authentication options
struct AuthenticationView: View {
    var body: some View {
        VStack {
            // Navigation link to the sign-in view with email
            NavigationLink {
                SignInEmailView()  // Destination view for email sign-in
            } label: {
                Text("Sign In With Email")  // Button text
                    .font(.headline)  // Font style for the button text
                    .foregroundColor(.white)  // Text color
                    .frame(height: 55)  // Height of the button
                    .frame(maxWidth: .infinity)  // Make the button fill the available width
                    .background(Color.blue)  // Background color of the button
                    .cornerRadius(15)  // Corner radius for rounded corners
            }
            Spacer()  // Spacer to push the content to the top
        }
        .navigationTitle("Sign In")  // Title of the navigation bar
        .padding(16)  // Padding around the content
    }
}

// Preview provider for SwiftUI previews
struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView()  // Preview the AuthenticationView within a NavigationStack
        }
    }
}

/*
 Description
 This SwiftUI code defines a view for user authentication options, specifically for signing in with an email.

 AuthenticationView:

 Displays a button that navigates to the SignInEmailView when tapped.
 The button has a custom style with a blue background, white text, and rounded corners.
 Uses a VStack to arrange the button and a spacer, which pushes the button to the top of the view.
 Sets the navigation title to "Sign In" and applies padding around the content.
 NavigationLink:

 Creates a link to another view, SignInEmailView, which is the destination for email sign-in.
 The label of the NavigationLink is a styled Text view that acts as a button.
 Preview Provider:

 Provides a preview of the AuthenticationView within a NavigationStack for the SwiftUI preview canvas. This allows developers to see and interact with the view in Xcode's preview pane.
 */
