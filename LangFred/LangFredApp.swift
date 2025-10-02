//
//  LangFredApp.swift
//  LangFred
//
//  Created by Chongbin Yao on 10/1/25.
//

import SwiftUI

@main
struct LangFredApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // Hide window control buttons (traffic lights)
                    if let window = NSApplication.shared.windows.first {
                        window.standardWindowButton(.closeButton)?.isHidden = true
                        window.standardWindowButton(.miniaturizeButton)?.isHidden = true
                        window.standardWindowButton(.zoomButton)?.isHidden = true
                    }
                }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
