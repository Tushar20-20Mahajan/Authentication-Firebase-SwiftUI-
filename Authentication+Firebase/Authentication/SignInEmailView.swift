

import SwiftUI


@MainActor
final class SignInEmailViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    func signIn()  {
        guard !email.isEmpty , !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print ("Success")
                print(returnedUserData)

            }catch{
                print("Error : \(error)")
            }
        }
    }
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack{
            TextField("Email" , text: $viewModel.email)
                .padding()
                .background(Color.gray)
                .opacity(0.5)
                .cornerRadius(15)
            
           SecureField("Password" , text: $viewModel.password)
                .padding()
                .background(Color.gray)
                .opacity(0.5)
                .cornerRadius(15)
            
            Button(action: {
                viewModel.signIn()
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height:55 )
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(15)
            })
            
            Spacer()
                
            
        }.navigationTitle("Sign In With Email")
            .padding(16)
    }
}


struct SignInEmailView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationStack{
           SignInEmailView()
        }
    }
}
