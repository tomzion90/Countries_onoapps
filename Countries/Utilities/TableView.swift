//
//  TableView.swift
//  Countries
//
//  Created by Tom Zion on 14/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class TableView<T: TableViewCell<M>, M>: UITableViewController {
    
    var items = [M]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        tableView.register(cellType: T.self)
    }
    
    func configureTableView(with delegate: UITableViewDelegate,estimatedRowHeight: CGFloat?,automaticDimensionRowHeight: Bool) {
        tableView.delegate = delegate
        tableView.dataSource = self
        if let estimatedRowHeight = estimatedRowHeight {
          tableView.estimatedRowHeight = estimatedRowHeight
        }
        if automaticDimensionRowHeight {
           tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! TableViewCell<M>
        cell.fill(with: self.items[indexPath.row])
        return cell
    }
}

class TableViewCell<M>: UITableViewCell {
    
    var item: M!
    
    func fill(with item: M) {
        self.item = item
    }
}
