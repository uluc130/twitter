//
//  Twitter_CloneApp.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

@main
struct Twitter_CloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
            
        }
    }
}
