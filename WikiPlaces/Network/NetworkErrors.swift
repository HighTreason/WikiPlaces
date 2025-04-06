//
//  NetworkErrors.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation

enum NetworkError: Error {
    case decodingFailed
    case invalidStatusCode(statusCode: Int)
}
