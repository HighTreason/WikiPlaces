//
//  ViewState.swift
//  WikiPlaces
//
//  Created by Charles Abou Yakdan on 05/04/2025.
//

import Foundation

enum ViewState: Equatable {
    case loading
    case success
    case failure(Error)
    
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        return switch (lhs, rhs) {
        case (.loading, .loading), (.success, .success): true
        case (.failure(let lerr as NSError), .failure(let rerr as NSError)):
            lerr.domain == rerr.domain && lerr.code == rerr.code
        default: false
        }
    }
}
