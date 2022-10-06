//
//  BBActorsApp.swift
//  BBActors
//
//  Created by Hossein Hajimirza on 10/5/22.
//

import SwiftUI

@main
struct BBActorsApp: App {
    // And now in your App scene, use the UIApplicationDelegateAdaptor property wrapper to tell SwiftUI it should use your AppDelegate class for the application delegate. "HackingWifthSwift.com"
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            BreakingBadTabView()
        }
    }
}
