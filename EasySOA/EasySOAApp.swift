//
//  EasySOAApp.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import SwiftUI

@main
struct EasySOAApp: App {
    var model: UserInfoManager = UserInfoManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
