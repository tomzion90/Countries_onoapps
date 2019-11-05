//
//  BordersViewController.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class BordersViewController: UIViewController {
    
    let delegate = BordersTableViewDelegate()
    let dataSource = BordersTableViewDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    var country: Country?
    var searchTerm: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureSearchTerm()
        configureTableView()
        fetchBorders(searchTerm: searchTerm)
    }
    
    func configure() {
        title = "\(country?.name ?? "") Borders"
    }
    
    func configureSearchTerm() {
      guard let borders = country?.borders else { return }
        for border in borders {
            if borders.last != border {
               searchTerm += "\(border);"
            } else {
                searchTerm += "\(border)"
            }
        }
    }
    
    func configureTableView() {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
        
        tableView.register(cellType: BorderCell.self)
    }
    
    private func fetchBorders(searchTerm: String) {
        
        let stateView = StateView.loadFromNib()
        tableView.separatorStyle = .none
        stateView?.set(.loading)
        tableView.backgroundView = stateView
        
        if searchTerm.isEmpty {
            stateView?.set(.empty)
            return
        }
        
        Service.shared.fetchBorders(searchTerm: searchTerm) { [weak self] (borders, error) in
            
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if error != nil {
                    stateView?.set(.networkError)
                    return
                }
                
                guard let borders = borders else { return }
                self.dataSource.borders = borders
            
                self.tableView.reloadData()
                self.tableView.backgroundView = nil
                self.tableView.separatorStyle = .singleLine
            }
        }
    }
}
