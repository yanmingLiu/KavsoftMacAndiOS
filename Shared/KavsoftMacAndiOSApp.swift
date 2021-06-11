//
//  KavsoftMacAndiOSApp.swift
//  Shared
//
//  Created by lym on 2021/6/11.
//

import SwiftUI

@main
struct KavsoftMacAndiOSApp: App {
    var body: some Scene {
        #if os(macOS)
        WindowGroup {
            ContentView()
//                .frame(width: 1200, height: 800) // << here !!
//                .frame(minWidth: 1200, maxWidth: .infinity,
//                       minHeight: 800, maxHeight: .infinity)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        
        #else
        WindowGroup {
            ContentView()
        }
        #endif
    }
}
