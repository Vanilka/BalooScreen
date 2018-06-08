//
// Created by Vanilka on 02/04/2018.
// Copyright (c) 2018 Vanilla. All rights reserved.
//

import Foundation
import Cocoa

class ScreenService {
    static let sharedInstance = ScreenService()

    private var width: Float
    private var height: Float
    private var layoutX: Float
    private var layoutY: Float


    private init() {
        width = 100
        height = 200
        layoutX = 300
        layoutY = 300
    }

    public func doFullScreen() {

    }

    public func doRegionScreen(_ region: CGRect) -> CGImage {
        let displayID = CGMainDisplayID()
        return CGDisplayCreateImage(displayID, rect: region)!
    }

}