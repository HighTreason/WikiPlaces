//
//  PlacesService.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation
import OSLog

protocol PlacesServiceProtocol {
    func fetchLocations() async throws(NetworkError) -> Places?
}

final class PlacesService: PlacesServiceProtocol {
    func fetchLocations() async throws(NetworkError) -> Places? {
        let url = Endpoints.locations.url
        do {
            let request = URLRequest(url: url)
            let data = try await NetworkService.data(for: request)
            return try JSONDecoder().decode(Places.self, from: data)
        } catch let error {
            Logger.network.error("decoding error \(error)")
            throw .decodingFailed
        }
    }
}
