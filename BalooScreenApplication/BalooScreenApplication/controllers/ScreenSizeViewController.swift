//
//  ScreenSizeViewController.swift
//  BalooScreenApplication
//
//  Created by Vanilka on 13/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class ScreenSizeViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var widthField: NSTextField!
    @IBOutlet weak var heightField: NSTextField!

    @IBOutlet weak var widthStepper: NSStepper!
    @IBOutlet weak var heightStepper: NSStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        widthField.delegate = self
        heightField.delegate = self

        initSteppersMaxValues()
        initWidthAndHeightFieldsValues()
    }

    /**
        Update Textfields if changes occured.
        Needs textfield.delegate = self in viedDidLoadFunction
    */
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
    }

    @IBAction func confirm(_ sender: Any) {
    }

}
