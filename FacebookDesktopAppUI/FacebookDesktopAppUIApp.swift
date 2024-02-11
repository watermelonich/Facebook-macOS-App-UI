//
//  FacebookDesktopAppUIApp.swift
//  FacebookDesktopAppUI
//
//  Created by Nich on 2022/08/24.
//

import SwiftUI

@main
struct FacebookDesktopAppUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Hiding Window Title
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Textfield Ring....
extension NSTextField {

    open override var focusRingType: NSFocusRingType {
        get{.none}
        set{}
    }
}
