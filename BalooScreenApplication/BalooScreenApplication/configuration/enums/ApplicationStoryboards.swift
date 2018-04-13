//
// Created by Vanilka on 31/03/2018.
// Copyright (c) 2018 Vanilla. All rights reserved.
//

import Cocoa

enum ApplicationStoryboards : String {
    case Main = "Main"
    case Setting = "Settings"


    var instance : NSStoryboard {
        return NSStoryboard(name: NSStoryboard.Name(rawValue: self.rawValue), bundle: Bundle.main)
    }
}