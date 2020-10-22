//
//  Bundle+Resource.swift
//  Movie-App
//
//  Created by und3fined on 10/22/20.
//  Copyright © 2020 app.und3fined.com. All rights reserved.
//

import Foundation

extension Bundle {
    var resource: Bundle {
        // static framework
        if let resourceURL = resourceURL,
           let resourceBundle = Bundle(url: resourceURL.appendingPathComponent(ModuleName.name + ".bundle")) {
            return resourceBundle
        } else {
            // dynamic framework
            return self
        }
    }
}

private struct ModuleName {
    static var name: String = {
        String(reflecting: ModuleName.self).components(separatedBy: ".").first ?? ""
    }()
}
