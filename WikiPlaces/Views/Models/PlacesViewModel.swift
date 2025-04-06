//
//  PlacesViewModel.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation
import OSLog
import SwiftUI

@MainActor
final class PlacesViewModel: ObservableObject {
    @Published var state: ViewState = .loading
    @Published var places: Places?
    
    private let service: PlacesServiceProtocol
    init(service: PlacesServiceProtocol) {
        self.service = service
    }
    
    func fetchLocations() async {
        state = .loading
        places = nil
        
        do {
            self.places = try await self.service.fetchLocations()
            self.state = .success
        } catch {
            self.state = .failure(error)
            Logger.default.error("\(error)")
        }
    }
    
    func startWikipediaApp(with location: Location) {
        //TODO: Open the Wikipedia App
    }
}
