//
// Created by Vanilka on 02/04/2018.
// Copyright (c) 2018 Vanilla. All rights reserved.
//

import Foundation

class Configuration {

    private var imagesStoragePath: URL = URL(fileURLWithPath: "./")
    var imageNameSuffix: ImageNameSuffix
    var imageNamePrefix: String = "image-0"

    public init() {
        imagesStoragePath = URL(fileURLWithPath: "./")
        self.imageNameSuffix = ImageNameSuffix.init(type: SuffixType.TIME_BASE)
    }

    func getImagesStoragePath() -> URL {
        return imagesStoragePath
    }

    func setImagesStoragePath(path: String) {
        let fm: FileManager = FileManager.default
        print("Current Directory  \(fm.currentDirectoryPath)")
        print("Home directory :  \(fm.homeDirectoryForCurrentUser)")
        let url :URL  = path.isEmpty ? fm.homeDirectoryForCurrentUser.appendingPathComponent("BalooScreens") : URL(fileURLWithPath: path)
           do {
               try initPath(url: URL(fileURLWithPath: path))
               print("URL IS : \(url.path)")
           }  catch {
               print(error)
           }

    }

    func initPath(url: URL) throws {
        let fm: FileManager = FileManager.default
        var isDirectory: ObjCBool = ObjCBool(true)
        if !fm.fileExists(atPath: url.path, isDirectory: &isDirectory) {
            try fm.createDirectory(at: url, withIntermediateDirectories: true)
            imagesStoragePath = url
            print("url is  \(url)")
        }
    }
}

