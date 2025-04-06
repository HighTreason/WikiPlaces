//
//  Endpoints.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation

enum Endpoints {
    static let baseURL = "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main"

    case locations

    var url: URL {
        switch self {
        case .locations:
            return URL(string: "\(Endpoints.baseURL)/locations.json")!
        }
    }
}
