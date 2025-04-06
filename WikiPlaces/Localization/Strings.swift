//
//  Strings.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 06/04/2025.
//

import Foundation

struct Strings {
    static func addLocation() -> String {
        return String(localized: "add_location")
    }
        
    static func latitude() -> String {
        return String(localized: "latitude")
    }
    
    static func location_name() -> String {
        return String(localized: "location_name")
    }
    
    static func locations() -> String {
        return String(localized: "locations")
    }
    
    static func longitude() -> String {
        return String(localized: "longitude")
    }
    
    static func no_locations() -> String {
        return String(localized: "no_locations")
    }
    
    static func save() -> String {
        return String(localized: "save")
    }
}
