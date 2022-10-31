//
//  LoginView.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import SwiftUI
import TechjaysAPIHelper

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var data = VidRivalUser()
    var body: some View {
        NavigationView {
            VStack {
                Text(self.viewModel.result.firstname ?? "")
                NavigationLink(destination: HomeView()) {
                    Text("Login")
                } .onTapGesture {
                    activateLogin()
                }
            }.onAppear(){
                self.viewModel.viewUserProfile()
            }
        }
    }
    func activateLogin() {
        LoginManager.shared.isLogin = true
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}







