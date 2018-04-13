//
//  ConfigurationManager.swift
//  BalooScreenApplicaton
//
//  Created by Vanilka on 02/04/2018.
//  Copyright © 2018 Vanilla. All rights reserved.
//

import Foundation

class ConfigurationManager {
    static let selfInstance: ConfigurationManager = ConfigurationManager()

    let configuration: Configuration = Configuration();

    private init() {
        loadConfiguration()
    }

    private func loadConfiguration() {
        do {
            let path = Bundle.main.path(forResource: "config", ofType: "plist")
            let dict: NSDictionary? = NSDictionary(contentsOfFile: path!)
            populateConfiguration(dictionary: dict!)
        } catch {
            // Handle error
            print(error)
        }
    }


    private func populateConfiguration(dictionary: NSDictionary) {

        configuration.imageNamePrefix = (dictionary[ConfigKeys.CURRENT_NAME_PREFIX] as? String) ?? configuration.imageNamePrefix

        if let suffixType: SuffixType = SuffixType(rawValue: (dictionary[ConfigKeys.CURRENT_NAME_SUFFIX_TYPE] as? String)!) {
            configuration.imageNameSuffix.type = suffixType
            if(suffixType == SuffixType.NUMBER_BASE) {
                configuration.imageNameSuffix.setNextInt(int: (dictionary[ConfigKeys.CURRENT_NAME_SUFFIX_NEXT_NUMBER] as? Int) ?? 1)
            }
        }

        configuration.setImagesStoragePath(path: (dictionary[ConfigKeys.STORAGE_IMAGE_PATH] as? String) ?? "")
    }
}
