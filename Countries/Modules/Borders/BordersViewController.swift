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
        self.navigationItem.largeTitleDisplayMode = .never
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
        
        tableView.register(cellType: BorderCell.self)
    }
    
    private func fetchBorders(searchTerm: String) {
        
        let stateView = StateView.loadFromNib()
        tableView.separatorStyle = .none
        stateView?.set(.loading)
        tableView.backgroundView = stateView
        
        Service.shared.fetchBorders(searchTerm: searchTerm) { (borders, error) in
            
            if let error = error {
                stateView?.set(.networkError)
                print(error.localizedDescription)
            }
            
            guard let borders = borders else { return }
            self.dataSource.borders = borders
            
            self.reload(self.tableView)
        }
    }
}
