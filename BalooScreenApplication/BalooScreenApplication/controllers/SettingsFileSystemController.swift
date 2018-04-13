//
//  SettingsFileSystemController.swift
//  BalooScreenApplicaton
//
//  Created by Vanilka on 02/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Cocoa

class SettingsFileSystemController: NSViewController {

    let configuration : Configuration = ConfigurationManager.selfInstance.configuration

    @IBOutlet weak var imageStoringPath: NSTextField!

    @IBOutlet weak var prefixTextField: NSTextField!
    
    @IBOutlet weak var suffixTypeCombo: NSComboBox!
    
    @IBOutlet weak var suffixNextInt: NSTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageStoringPath.stringValue = configuration.getImagesStoragePath().path
        imageStoringPath.isEditable = false
        prefixTextField.stringValue = configuration.imageNamePrefix
        // Do view setup here.
    }
    
    @IBOutlet weak var suffixTypeChange: NSComboBox!
    
    @IBAction func changeImageStoringPath(_ sender: Any) {
    }
    
    
}
