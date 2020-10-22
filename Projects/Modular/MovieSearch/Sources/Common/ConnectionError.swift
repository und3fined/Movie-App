//
//  ConnectionError.swift
//  Movie-App
//
//  Created by und3fined on 10/22/20.
//  Copyright © 2020 app.und3fined.com. All rights reserved.
//

import Foundation

public protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

public extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}
