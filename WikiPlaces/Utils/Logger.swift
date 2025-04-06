//
//  Logger.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation
import OSLog

extension Logger {
    private static let bundleID = Bundle.main.bundleIdentifier!
    
    static let `default` = Logger(subsystem: bundleID, category: "application")
    static let ui = Logger(subsystem: bundleID, category: "ui")
    static let network = Logger(subsystem: bundleID, category: "network")
}
