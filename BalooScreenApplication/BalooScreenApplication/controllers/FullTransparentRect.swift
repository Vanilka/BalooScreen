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


    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        drawHole()
    }

    func drawHole() {
        let path = CGMutablePath()
        // Make hole in view's overlay
        path.addRect((self.superview?.bounds)!)
        path.addRect(self.frame)
        myLayer.path = path
        myLayer.fillRule = kCAFillRuleEvenOdd
        self.superview?.layer?.mask = myLayer
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
