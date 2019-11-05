//
//  BordersTableViewDataSource.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class BordersTableViewDataSource: NSObject, UITableViewDataSource {
    
    var borders = [Border]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let stateView = StateView.loadFromNib()
        stateView?.set(.noBoarders)
        
        if borders.count == 0 {
            tableView.backgroundView = stateView
            tableView.separatorStyle = .none
        }
        
        return borders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(BorderCell.self)", for: indexPath) as! BorderCell
        cell.fill(with: borders[indexPath.row])
        return cell
    }
    
    
}
