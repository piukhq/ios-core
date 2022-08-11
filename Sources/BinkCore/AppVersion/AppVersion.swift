//
//  AppVersion.swift
//  binkapp
//
//  Created by Nick Farrant on 10/05/2021.
//  Copyright © 2021 Bink. All rights reserved.
//

import Foundation

public class AppVersion {
    public let major: Int?
    public let minor: Int?
    public let patch: Int?
    
    lazy public var versionString = readableVersionString
    
    enum VersionComponent: Int, CaseIterable {
        case major
        case minor
        case patch
    }
    
    public init?(versionString: String) {
        /// Only accept the components matching our supported Version Components
        let components = Array(versionString.components(separatedBy: ".").prefix(VersionComponent.allCases.count))
        
        /// We must be able to atleast parse a major number from the version string, otherwise return nil
        guard let major = components[safe: VersionComponent.major.rawValue]?.convertToInt() else { return nil }
        self.major = major
        
        self.minor = components[safe: VersionComponent.minor.rawValue]?.convertToInt()
        self.patch = components[safe: VersionComponent.patch.rawValue]?.convertToInt()
    }
    
    private lazy var readableVersionString: String = {
        var readableVersionString: [String] = []
        let components = [major, minor, patch]
        components.forEach { component in
            guard let component = component else { return }
            readableVersionString.append("\(component)")
        }
        return readableVersionString.joined(separator: ".")
    }()
    
    public func isMoreRecentThanVersion(_ version: AppVersion) -> Bool {
        /// If comparison major is lower, return true
        /// If comparison major is higher, return false
        guard let comparisonMajor = version.major, let major = self.major else { return false }
        if major > comparisonMajor { return true }
        if comparisonMajor > major { return false }
        /// If comparison major is the same, move to minor
        
        /// If comparison minor is lower, return true
        /// If comparison minor is higher, return false
        guard let comparisonMinor = version.minor, let minor = self.minor else { return false }
        if minor > comparisonMinor { return true }
        if comparisonMinor > minor { return false }
        /// If comparison minor is the same, move to patch
        
        /// If comparison patch is lower, return true
        /// If comparison patch is higher, return false
        guard let comparisonPatch = version.patch, let patch = self.patch else { return false }
        if patch > comparisonPatch { return true }
        if comparisonPatch > patch { return false }
        
        /// If comparison patch is the same, return false
        return false
    }
}

extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}

