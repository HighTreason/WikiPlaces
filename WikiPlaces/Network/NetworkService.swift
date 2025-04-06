//
//  NetworkService.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    static func data(for request: URLRequest) async throws -> Data
}

extension NetworkServiceProtocol {
    static func data(for request: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidStatusCode(statusCode: -1)
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }

        return data
    }
}

class NetworkService: NetworkServiceProtocol { }
