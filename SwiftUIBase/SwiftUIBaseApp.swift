//
//  SwiftUIBaseApp.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import SwiftUI

@main
struct SwiftUIBaseApp: App {
    var body: some Scene {
        WindowGroup {
            if LoginManager.shared.isLogin {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}
