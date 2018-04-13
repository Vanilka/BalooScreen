//
//  MainWindowController.swift
//  BalooScreenApplicaton
//
//  Created by Vanilka on 30/03/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.title = Titles.WINDOW_TITLE
    }

    @IBAction func settingsClick(_ sender: Any) {
        print("Setting Click")

    }

    @IBAction func customScreenShootClick(_ sender: Any) {
        print("Custom click")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "stopSoundNotification"), object: nil)
    }


}

