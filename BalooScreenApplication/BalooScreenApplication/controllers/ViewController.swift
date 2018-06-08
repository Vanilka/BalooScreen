//
//  ViewController.swift
//  BalooScreenApplicaton
//
//  Created by Vanilka on 30/03/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa


class ViewController: NSViewController {

    @IBOutlet weak var screenShootImage: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Me load")

    }

    override func viewWillAppear() {
        super.viewWillAppear()



        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(_:)), name: .imageNotification, object: nil)


    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }

     func updateImage(image: NSImage) {
        screenShootImage.image = image
         screenShootImage.imageScaling = .scaleProportionallyDown

    }


    @objc func getScreenshot() {
    /*    print("do screens")



  *//*      let displayID = CGMainDisplayID()
        let imageRef = CGDisplayCreateImage(displayID)*//*

        let displayID = CGMainDisplayID()
        let imageRef = CGDisplayCreateImage(displayID)



        let rep = self.view.bitmapImageRepForCachingDisplay(in: self.view.bounds)!
        self.view.cacheDisplay(in: self.view.bounds, to: rep)
        let image: NSImage = NSImage()
        image.addRepresentation(rep)

        saveAsPNG(url: URL(fileURLWithPath: "./myfile.png"), image: NSImage.init(cgImage: imageRef!, size: NSSize.init(width: (imageRef?.width)!, height: (imageRef?.height)!)))

    }


    func saveAsPNG(url: URL, image: NSImage) -> Bool {
        guard let tiffData = image.tiffRepresentation else {
            print("failed to get tiffRepresentation. url: \(url)")
            return false
        }
        let imageRep = NSBitmapImageRep(data: tiffData)
        guard let imageData = imageRep?.representation(using: .png, properties: [:]) else {
            print("failed to get PNG representation. url: \(url)")
            return false
        }
        do {
            try imageData.write(to: url)
            return true
        } catch {
            print("failed to write to disk. url: \(url)")
            print(error)
            return false
        }*/
    }


    @objc func loadList(notification: Notification) {
        print("test load")

    }

    @objc func notificationReceived(_ notification: Notification) {
        print("revieved image")
        guard let text: CGImage = notification.userInfo?["image"] as! CGImage else {
            print("will return without save")
            return }

       updateImage(image: NSImage(cgImage: text, size: NSZeroSize))
    }

}
