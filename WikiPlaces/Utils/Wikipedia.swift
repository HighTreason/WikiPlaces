//
//  Wikipedia.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 06/04/2025.
//

import Foundation
import OSLog
import UIKit

struct Wikipedia {
    private static let userActivityPlaces = "places"
    private static let scheme = "wikipedia"
    private static let coordinatesQueryKey = "WMFCoordinates"
    
    static func startWikipediaApp(with location: Location) {
        let coordinates = "\(location.lat),\(location.long)"
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = userActivityPlaces
        components.queryItems = [
            URLQueryItem(name: coordinatesQueryKey, value: coordinates)
        ]
        
        let wikipediaAppUrl = components.url!
        if UIApplication.shared.canOpenURL(wikipediaAppUrl) {
            UIApplication.shared.open(wikipediaAppUrl)
        } else {
            Logger.default.error("can't open wikipedia app")
        }
    }
}
