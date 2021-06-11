//
//  NSTextField+Ext.swift
//  Kavsoft_MacOS_iOS
//
//  Created by lym on 2021/6/10.
//

import SwiftUI

#if os(macOS)
extension NSTextField {
    override open var focusRingType: NSFocusRingType {
        get { .none }
        set {}
    }
}
#endif
