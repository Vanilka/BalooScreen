//
//  ScreenTranparentWindowController.swift
//  BalooScreenApplication
//
//  Created by Vanilka on 14/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class ScreenTransparentWindowController: NSWindowController {


    override func windowDidLoad() {
        super.windowDidLoad()

        print("Load me window")
        self.window?.isOpaque = false
        self.window?.backgroundColor = NSColor(calibratedHue: 0, saturation: 0, brightness: 0, alpha: 0.7)
        self.window?.hasShadow = false

        if let screen = window?.screen ?? NSScreen.main {
            window?.setFrame(screen.visibleFrame, display: true)
            window?.level = .normal
        }
    }
    
}
