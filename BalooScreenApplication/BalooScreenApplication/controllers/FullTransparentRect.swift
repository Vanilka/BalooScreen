//
//  FullTransparentRect.swift
//  BalooScreenApplication
//
//  Created by Martyna Szymkowiak on 05/06/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class FullTransparentRect: NSView {

    var firstMouseDownPoint: NSPoint = NSZeroPoint
    let myLayer = CAShapeLayer()
    let borderSize: CGFloat = 2.0


    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.layer?.backgroundColor = NSColor.lightGray.cgColor
        drawHole()
    }

    func drawHole() {
        let path = CGMutablePath()
        // Make hole in view's overlay
        path.addRect((self.superview?.bounds)!)
        path.addRect(NSRect(x: self.frame.origin.x + borderSize,
                y: self.frame.origin.y + borderSize,
                width: self.frame.size.width - (borderSize * 2),
                height: self.frame.size.height - (borderSize * 2)))

        myLayer.path = path
        myLayer.fillRule = kCAFillRuleEvenOdd
        self.superview?.layer?.mask = myLayer
        self.layer?.borderColor = NSColor.lightGray.cgColor
        self.layer?.borderWidth = borderSize
    }

    //Decrapted for now
    func getHole() -> CGImage {

        var rect = self.convert((self.layer?.frame)!, to: self.window?.contentView)

      //  print("rect \(rect)")

        let displayID = CGMainDisplayID()
        return  CGDisplayCreateImage(displayID, rect: rect)!
    }

    func setWidth(width: CGFloat) {
        var f = self.frame;
        f.size.width = width;
        self.frame = f;
    }

    func setHeight(height: CGFloat) {
        var f = self.frame;
        f.size.height = height;
        self.frame = f;

    }


    override func mouseDown(with event: NSEvent) {
        firstMouseDownPoint = (self.window?.contentView?.convert(event.locationInWindow, to: self))!
        print("Mouse on: \(event.locationInWindow)")
        print("Mouse click on : \(firstMouseDownPoint)")
    }

    override func mouseDragged(with event: NSEvent) {
        let newPoint = (self.window?.contentView?.convert(event.locationInWindow, to: self))!
        let offset = NSPoint(x: newPoint.x - firstMouseDownPoint.x, y: newPoint.y - firstMouseDownPoint.y)
        let origin = self.frame.origin
        let size = self.frame.size
        self.frame = NSRect(x: origin.x + offset.x, y: origin.y + offset.y, width: size.width, height: size.height)
        drawHole()
    }

}
