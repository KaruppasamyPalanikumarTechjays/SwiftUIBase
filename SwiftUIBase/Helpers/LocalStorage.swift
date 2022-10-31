//
//  LocalStorage.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import Foundation

class LocalStorage {
    
    private
    init() { }
    
    public static
    let shared = LocalStorage()
    
    public
    func getValue<T>(for key:UserDefaultKeys) -> T? {
        return UserDefaults.standard.value(forKey: key.rawValue) as? T
    }
    
    public
    func setValue(for key:UserDefaultKeys,value: Any) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
}
