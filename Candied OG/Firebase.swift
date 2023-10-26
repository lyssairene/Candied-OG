//
//  Firebase.swift
//  Candied OG
//
//  Created by Alyssa Pollard on 10/7/23.
//

import SwiftUI
import FirebaseCore



func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }


@main
struct Candied : App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ViewController()
      }
    }
  }
}

