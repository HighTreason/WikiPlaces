//
//  LocationViewModel.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation

struct LocationViewModel {
    let name: String
    let longitude: String
    let latitude: String
    
    var coordinates: String {
        let values = [latitude, longitude].filter { !$0.isEmpty }
        return values.joined(separator: ",")
    }
}
