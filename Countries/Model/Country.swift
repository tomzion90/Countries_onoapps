//
//  Countries.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

struct Country: Decodable, Comparable {
    var name: String
    var nativeName: String?
    var area: CGFloat?
    var flag: String?
    
    var borders: [String]?
    
    static func < (lhs: Country, rhs: Country) -> Bool {
        return lhs.area ?? 0 > rhs.area ?? 0
    }
}

