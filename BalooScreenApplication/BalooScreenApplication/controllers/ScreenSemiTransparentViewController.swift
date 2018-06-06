//
//  ScreenSemiTransparentViewController.swift
//  BalooScreenApplication
//
//  Created by Vanilka on 14/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class ScreenTransparentViewController: NSViewController {
    var sizeController: ScreenSizeViewController? = nil
    var transparentHoleView: FullTransparentRect? = nil


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor(calibratedHue: 0, saturation: 0, brightness: 0, alpha: 0.7).cgColor
        transparentHoleView = FullTransparentRect(frame: NSRect(x:100, y:100, width: 200, height: 200))
        self.view.addSubview(transparentHoleView!)

    }

    override func viewDidLayout() {
        super.viewDidLayout()
    }

    func registerScreenSizeController(controller: ScreenSizeViewController) {
        self.sizeController = controller
    }
}
