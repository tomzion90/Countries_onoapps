//
//  CountriesViewController.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    // MARK: - Propertires
    let delegate = CountriesTableViewDelegate()
    let dataSource = CountriesTableViewDataSource()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTableView()
    }
    
    func configure() {
        title = "Countries"
    }
    
    func configureTableView(){
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(cellType: CountriesCell.self)
    }
}

