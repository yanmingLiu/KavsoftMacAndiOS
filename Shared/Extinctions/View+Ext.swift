//
//  View+Ext.swift
//  Kavsoft_MacOS_iOS
//
//  Created by lym on 2021/6/10.
//

import SwiftUI

extension View {
    func getRect() -> CGRect {
        #if os(macOS)
            return NSScreen.main!.visibleFrame
        #else
            return UIScreen.main.bounds
        #endif
    }
    
    func isMacOS() -> Bool {
        #if os(macOS)
            return true
        #else
            return false
        #endif
    }
}
