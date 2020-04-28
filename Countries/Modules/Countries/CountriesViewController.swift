//
//  CountriesViewController.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class CountriesViewController: TableView<CountriesCell, Country> {
    
    let delegate = CountriesTableViewDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [Country]()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func configure() {
        super.configure()
        title = "Countries"
        let navigationSortButton = UIBarButtonItem(image: UIImage(named: "sorting_icon"), style: .plain, target: self, action: #selector(sortingWithOptions))
        navigationItem.rightBarButtonItem = navigationSortButton
        
        configureTableView(with: delegate, estimatedRowHeight: 300, automaticDimensionRowHeight: true)
        delegate.selectionDelegate = self
    }
    
    private func fetchData() {
        
        let stateView = StateView.loadFromNib()
        stateView?.delegate = self
        tableView.separatorStyle = .none
        stateView?.set(.loading)
        tableView.backgroundView = stateView
        
        Service.shared.fetchCountries { (result) in
            switch result {
            case .success(let countries):
                 self.items = countries
                if countries.count == 0 {
                    stateView?.set(.empty)
                    return
                }
            case .failure(let error):
                stateView?.set(.networkError)
            }

            self.tableView.reloadData()
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
        }
    }
    
    @objc func sortingWithOptions() {
        let alertController = UIAlertController(title: "Sort by:", message: nil, preferredStyle: .actionSheet)
        let sortAlphabetically = UIAlertAction(title: "Alphabets", style: .default) { _ in
            self.sortAlphabetically()
        }
        let sortByAreaSize = UIAlertAction(title: "Area size", style: .default) { _ in
            self.sortByAreaSize()
        }
        
        alertController.addAction(sortAlphabetically)
        alertController.addAction(sortByAreaSize)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func sortAlphabetically() {
        self.items.sort(by: {$0.name < $1.name})
        self.reload(tableView)
    }
    
    func sortByAreaSize() {
         self.items.sort(by: {$0 < $1})
        self.reload(tableView)
    }
}

extension CountriesViewController: CountrySelectionDelegate {
    
    func presentBorders(of country: Country) {
        let viewController = BordersViewController()
        viewController.country = country
        UIView.animate(withDuration: 1) {
            self.navigationController?.pushViewController(viewController, animated: false)
        }
    }
}

extension CountriesViewController: stateViewDidTapActionDelegate {
    
    func stateViewDidTapActionButton() {
        self.fetchData()
    }
}

