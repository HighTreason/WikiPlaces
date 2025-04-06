//
//  PlacesTests.swift
//  WikiPlacesTests
//
//  Created by Charles Abou Yakdan on 06/04/2025.
//

import Testing
@testable import WikiPlaces

@MainActor
@Suite(.serialized)
struct PlacesTests {

    @Test func testEmptyResponse() async throws {
        let components = makeSUT(empty: true)
        await components.sut.fetchLocations()
        
        #expect(components.service.fetchLocationsCalled == true)
        #expect(components.sut.state == .success)
        #expect(components.sut.places != nil)
        #expect(components.sut.places?.locations.count == 0)
    }
    
    @Test func testNilResponse() async throws {
        let components = makeSUT(returns: nil)
        await components.sut.fetchLocations()
        
        #expect(components.service.fetchLocationsCalled == true)
        #expect(components.sut.state == .success)
        #expect(components.sut.places == nil)
    }
    
    @Test func testServerErrorResponse() async throws {
        let components = makeSUT(throws: .invalidStatusCode(statusCode: 500))
        await components.sut.fetchLocations()
        
        #expect(components.service.fetchLocationsCalled == true)
        #expect(components.sut.state == .failure(NetworkError.invalidStatusCode(statusCode: 500)))
        #expect(components.sut.places == nil)
    }
}

extension PlacesTests {
    typealias Components = (
        sut: PlacesViewModel,
        service: MockPlacesService
    )
    
    func makeSUT(empty: Bool = false, throws error: NetworkError? = nil, returns: Places? = nil) -> Components {
        let service = MockPlacesService(empty: empty, throws: error, returns: returns)
        let viewModel = PlacesViewModel(service: service)
        return (viewModel, service)
    }
}
