//
// Created by Vanilka on 02/04/2018.
// Copyright (c) 2018 Vanilla. All rights reserved.
//

import Foundation

enum SuffixType: String {
    case TIME_BASE = "TIME"
    case NUMBER_BASE = "NUMBER"

}

class ImageNameSuffix {

    var type: SuffixType
    private var nextInt: Int = 1

    func nextSuffix() -> String {
        switch (type) {
        case .NUMBER_BASE: return getNumberNextSuffix()
        case .TIME_BASE: return getNumberNextSuffix()
        }
    }

    func setNextInt(int: Int) {
        nextInt = int
    }
    private func getTimeSuffix() -> String {
        return String(Date().timeIntervalSince1970)
    }

    private func getNumberNextSuffix() -> String {
        let currentSuffix: Int = nextInt
        nextInt += 1
        return String(currentSuffix)
    }


    public init(type: SuffixType) {
        self.type = type
    }

}

