//
//  Firebase.swift
//  Candied OG
//
//  Created by Alyssa Pollard on 10/7/23.
//

import SwiftUI
import Firebase

struct CandiedPOS: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup{
            ViewController()
                .environmentObject(dataManager)
        }
    }
}

