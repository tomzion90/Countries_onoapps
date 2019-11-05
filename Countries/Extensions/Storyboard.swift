//
//  Storyboard.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

enum ViewController: String {
    case countriesViewController = "CountriesViewController"
}

enum Storyboard: String {
    case countries = "Countries"
}

extension UIStoryboard {
    static func instantiate(viewController identifier: ViewController, withStoryboard name: Storyboard) -> UIViewController {
        let board = UIStoryboard(name: name.rawValue, bundle: nil)
        return board.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}

