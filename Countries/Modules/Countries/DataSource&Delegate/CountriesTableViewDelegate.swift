//
//  CountriesTableViewDelegate.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

protocol CountrySelectionDelegate: class {
    func presentBorders(of country: Country)
}

class CountriesTableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var selectionDelegate: CountrySelectionDelegate?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath) as? CountriesCell, let country = cell.item {
            selectionDelegate?.presentBorders(of: country)
        }
    }
}
