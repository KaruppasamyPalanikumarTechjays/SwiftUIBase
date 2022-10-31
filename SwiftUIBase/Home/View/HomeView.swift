//
//  HomeView.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            HStack{
                Spacer()
                NavigationLink(destination: LoginView()) {
                    Button {
                        LoginManager.shared.isLogin = false
                    } label: {
                        Text("Logout")
                            .padding(.all)
                    }
                }
            }
            ScrollView(showsIndicators: false) {
                LazyVStack(
                    alignment: .leading,
                    spacing: 0,
                    pinnedViews: .sectionHeaders) {
                        ForEach(viewModel.result,
                                id: \.userId) { detail in
                            HomeCellView(userDetail: detail)
                                .onAppear {
                                    viewModel.getMoreData(currentData: detail)
                                }
                        }
                    }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
