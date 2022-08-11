//
//  Bundle+binkapp.swift
//  binkapp
//
//  Created by Pop Dorin on 06/11/2019.
//  Copyright © 2019 Bink. All rights reserved.
//

import Foundation

extension Bundle {
    static public let shortVersionNumber = main.infoDictionary?["CFBundleShortVersionString"] as? String
    static public let bundleVersion = main.infoDictionary?["CFBundleVersion"] as? String
    static public let currentVersion: AppVersion? = {
        guard let versionString = shortVersionNumber else { return nil }
        return AppVersion(versionString: versionString)
    }()
}
