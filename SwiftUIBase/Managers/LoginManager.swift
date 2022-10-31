//
//  LoginManager.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import Foundation

class LoginManager {
    
    private
    init() { }
    
    public static
    let shared = LoginManager()
    
    var isLogin: Bool {
        get {
            if let value: Bool = LocalStorage.shared.getValue(for: .isLogin) {
                return value
            } else {
                return false
            }
        }
        set {
            LocalStorage.shared.setValue(for: .isLogin, value: newValue)
        }
    }
    
}

