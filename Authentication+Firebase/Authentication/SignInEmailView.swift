import SwiftUI

// ViewModel to manage sign-in logic and state for SignInEmailView
@MainActor
final class SignInEmailViewModel: ObservableObject {
    @Published var email = ""  // Published property to store email input
    @Published var password = ""  // Published property to store password input
    
    // Function to handle sign-in logic
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")  // Print message if email or password is empty
            return
        }
        
        Task {
            do {
                // Try to create a user with the provided email and password
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)  // Print success message and returned user data
            } catch {
                print("Error: \(error)")  // Print error message if sign-in fails
            }
        }
    }
}

// View for signing in with email
struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()  // StateObject to hold the ViewModel
    
    var body: some View {
        VStack {
            // TextField for email input
            TextField("Email", text: $viewModel.email)
                .padding()  // Add padding around the text field
                .background(Color.gray)  // Set background color to gray
                .opacity(0.5)  // Set opacity to make the background semi-transparent
                .cornerRadius(15)  // Round the corners of the text field
            
            // SecureField for password input
            SecureField("Password", text: $viewModel.password)
                .padding()  // Add padding around the text field
                .background(Color.gray)  // Set background color to gray
                .opacity(0.5)  // Set opacity to make the background semi-transparent
                .cornerRadius(15)  // Round the corners of the text field
            
            // Button to trigger the sign-in action
            Button(action: {
                viewModel.signIn()  // Call sign-in function when button is tapped
            }, label: {
                Text("Sign In")  // Button text
                    .font(.headline)  // Font style for the button text
                    .foregroundColor(.white)  // Text color
                    .frame(height: 55)  // Height of the button
                    .frame(maxWidth: .infinity)  // Make the button fill the available width
                    .background(Color.blue)  // Background color of the button
                    .cornerRadius(15)  // Corner radius for rounded corners
            })
            
            Spacer()  // Spacer to push the content to the top
        }
        .navigationTitle("Sign In With Email")  // Title of the navigation bar
        .padding(16)  // Padding around the content
    }
}

// Preview provider for SwiftUI previews
struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView()  // Preview the SignInEmailView within a NavigationStack
        }
    }
}


/*
 Description
 This SwiftUI code defines a view for signing in with an email and a ViewModel to manage the sign-in logic.

 SignInEmailViewModel:

 An ObservableObject class that handles the state and logic for the email sign-in process.
 Contains @Published properties for email and password input fields.
 The signIn function checks if the email and password are not empty, then performs the sign-in operation using the AuthenticationManager.
 SignInEmailView:

 A view that provides a user interface for entering an email and password and signing in.
 Uses TextField and SecureField for email and password input, respectively.
 A Button triggers the signIn function in the ViewModel.
 The layout is managed using a VStack with padding and a navigation title.
 Preview Provider:

 Provides a preview of the SignInEmailView within a NavigationStack for the SwiftUI preview canvas, allowing developers to see and interact with the view in Xcode's preview pane.
 */
