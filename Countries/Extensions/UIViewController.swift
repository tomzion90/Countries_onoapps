//
//  UIViewController.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func reload(_ tableView: UITableView) {
        DispatchQueue.main.async {
            tableView.reloadData()
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
        }
    }
}
