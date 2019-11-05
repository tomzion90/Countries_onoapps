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
        fetchData()
    }
    
    func configure() {
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView(){
        
        tableView.delegate = delegate
        delegate.selectionDelegate = self
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(cellType: CountriesCell.self)
    }
    
    func fetchData() {
        Service.shared.fetchData { (countries, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let countries = countries else { return }
            self.dataSource.countries = countries
            self.delegate.countries = countries
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension CountriesViewController: CountrySelectionDelegate {
    
    func presentBorders(of country: Country) {
        var viewController = BordersViewController(country: country)
        viewController = UIStoryboard.instantiate(viewController: ViewController.bordersViewController, withStoryboard: Storyboard.borders) as! BordersViewController
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}

