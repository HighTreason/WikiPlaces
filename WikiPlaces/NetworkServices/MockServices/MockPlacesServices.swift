//
//  MockPlacesServices.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 06/04/2025.
//

import Foundation

final class MockPlacesService: PlacesServiceProtocol {
    private let empty: Bool
    private let error: NetworkError?
    private let returns: Places?
    
    private(set) var fetchLocationsCalled: Bool = false

    init(empty: Bool = false, throws error: NetworkError? = nil, returns: Places? = nil) {
        self.empty = empty
        self.error = error
        self.returns = returns
    }
    
    func fetchLocations() async throws(NetworkError) -> Places? {
        self.fetchLocationsCalled = true
        if let returns {
            return returns
        } else if empty {
            return Places(
                locations: []
            )
        } else if let error {
            throw error
        }
        
        return nil
    }
}
