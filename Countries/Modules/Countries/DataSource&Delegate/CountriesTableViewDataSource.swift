//
//  CountriesTableViewDataSource.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class CountriesTableViewDataSource: NSObject, UITableViewDataSource {
    
    var countries = [Country]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountriesCell.self)", for: indexPath) as! CountriesCell
        cell.fill(with: countries[indexPath.row])
        return cell
    }
}
