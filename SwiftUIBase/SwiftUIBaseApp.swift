//
//  SwiftUIBaseApp.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import SwiftUI
import TechjaysAPIHelper

@main
struct SwiftUIBaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        TechjaysAPIHelper.shared.setupApiHelper(baseUrl: "https://dev-myvidrivals.myvidhire.com/", version: "api/v1/", token: "96fb85ed49769a7b866024c799b4ef2771933268")
        return true
    }
}
