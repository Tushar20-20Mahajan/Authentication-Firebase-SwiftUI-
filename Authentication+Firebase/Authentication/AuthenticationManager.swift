import Foundation
import FirebaseAuth

// Model to represent authentication data result
struct AuthDataResultModel {
    let uid: String           // Unique identifier for the user
    let email: String?        // Email of the user
    let photoUrl: String?     // URL to the user's photo
    
    // Initialize the model using a Firebase User object
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

// Singleton class to manage authentication using Firebase
final class AuthenticationManager {
    static let shared = AuthenticationManager()  // Shared instance for singleton pattern
    
    private init() {}  // Private initializer to prevent multiple instances
    
    // Function to create a new user with email and password
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)  // Return the authenticated user data
    }
    
    // Function to get the currently authenticated user
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)  // Throw an error if no user is authenticated
        }
        return AuthDataResultModel(user: user)  // Return the authenticated user data
    }
    
    // Function to sign out the current user
    func signOut() throws {
        try Auth.auth().signOut()  // Sign out the current user
    }
}


/*
 Description
 This code defines an authentication manager for handling user authentication using Firebase in a Swift application. It includes two main components:

 AuthDataResultModel:

 A struct to represent the authenticated user's data.
 Contains properties for the user ID (uid), email, and photo URL.
 The initializer takes a User object from Firebase and extracts the necessary data.
 AuthenticationManager:

 A singleton class to manage authentication operations using Firebase Authentication.
 Contains methods for creating a new user, retrieving the currently authenticated user, and signing out the user.
 createUser(email:password:): Creates a new user with the provided email and password, and returns an AuthDataResultModel representing the new user.
 getAuthenticatedUser(): Retrieves the currently authenticated user and returns an AuthDataResultModel. Throws an error if no user is authenticated.
 signOut(): Signs out the currently authenticated user.
 */
