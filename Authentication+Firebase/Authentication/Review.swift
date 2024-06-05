//
//  Review.swift
//  Authentication+Firebase
//
//  Created by Sunidhi Ratra on 05/06/24.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView : Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
            }
        }.onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack{
                AuthenticationView()
            }
        })
       
    }
}

struct RootView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationStack{
           RootView()
        }
    }
}
