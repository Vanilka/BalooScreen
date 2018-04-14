//
//  ScreenTransparentViewController.swift
//  BalooScreenApplication
//
//  Created by Vanilka on 14/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class ScreenTransparentViewController: NSViewController {
    var sizeController: ScreenSizeViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        print("intantiate")

    }

    func registerScreenSizeController(controller: ScreenSizeViewController) {
        self.sizeController = controller
    }
}
