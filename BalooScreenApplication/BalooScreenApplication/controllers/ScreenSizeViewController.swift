//
//  ScreenSizeViewController.swift
//  BalooScreenApplication
//
//  Created by Vanilka on 13/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class ScreenSizeViewController: NSViewController, NSTextFieldDelegate {

    var observingFloat = false

    @IBOutlet weak var widthField: NSTextField!
    @IBOutlet weak var heightField: NSTextField!

    @IBOutlet weak var widthStepper: NSStepper!
    @IBOutlet weak var heightStepper: NSStepper!

    var screenTransparentController: ScreenTransparentViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        widthField.delegate = self
        heightField.delegate = self

        initSteppersMaxValues()
        initWidthAndHeightFieldsValues()

        initOnTopObserver()
        loadScreenTransparentWindow()
    }

    private func initOnTopObserver() {
        if self.view.window != nil {
            view.window?.level = NSWindow.Level(rawValue: 1)
        } else {
            observingFloat = true
            self.addObserver(self, forKeyPath: "view.window", options: [.new, .initial], context: nil)
        }
    }


    override func viewWillAppear() {
        NSApplication.shared.activate(ignoringOtherApps: true)
    }


    public override func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {

            guard let value: Double = textField.doubleValue else {
                return
            }

            if textField.identifier == widthField.identifier {
                widthStepper.doubleValue = value
            }

            if textField.identifier == heightField.identifier {
                heightStepper.doubleValue = value
            }
        }
    }

    private func initWidthAndHeightFieldsValues() {
        widthField.stringValue = String(100.0)
        widthStepper.doubleValue = 100.0
        heightField.stringValue = String(200.0)
        heightStepper.doubleValue = 200.0
    }

    private func initSteppersMaxValues() {
        let bounds = NSScreen.main?.visibleFrame.size
        widthStepper.maxValue = Double((bounds?.width) ?? 400.0)
        heightStepper.maxValue = Double((bounds?.height) ?? 600.0)
    }


    @IBAction func widthStep(_ sender: NSStepper) {
        widthField.stringValue = String(sender.doubleValue)
    }

    @IBAction func heightStep(_ sender: NSStepper) {
        heightField.stringValue = String(sender.doubleValue)
    }

    @IBAction func cancel(_ sender: Any) {
        self.view.window?.close()
        screenTransparentController?.view.window?.close()
    }

    @IBAction func confirm(_ sender: Any) {
    }

    public func registerScreenTransparentController(controller: ScreenTransparentViewController) {
        screenTransparentController = controller
    }

    private func loadScreenTransparentWindow() { // Do view setup here.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Screen"), bundle: nil)

        if let screenController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "ScreenTransparent")) as? ScreenTransparentViewController {

            screenController.registerScreenSizeController(controller: self)
            screenTransparentController = screenController
            let newWindow = NSWindow(contentViewController: screenController)
            // you'll probably need to pass your window some data and because I hate myself I choose to do it like this
            newWindow.makeKeyAndOrderFront(self)
            let controller = ScreenTransparentWindowController(window: newWindow)
            controller.windowDidLoad()
            controller.showWindow(self)
        }
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if self.view.window != nil {
            view.window?.level = NSWindow.Level(rawValue: 1)
        }
    }
}
