//
//  CountriesViewController.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
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
        
        let navigationSortButton = UIBarButtonItem(image: UIImage(named: "sorting_icon"), style: .plain, target: self, action: #selector(sortingWithOptions))
        navigationItem.rightBarButtonItem = navigationSortButton
    }
    
    func configureTableView(){
        
        tableView.delegate = delegate
        delegate.selectionDelegate = self
        tableView.dataSource = dataSource
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(cellType: CountriesCell.self)
    }
    
    private func fetchData() {
        
        let stateView = StateView.loadFromNib()
        tableView.separatorStyle = .none
        stateView?.set(.loading)
        tableView.backgroundView = stateView
        
        Service.shared.fetchData { (countries, error) in
            
            if let error = error {
                stateView?.set(.networkError)
                print(error.localizedDescription)
            }
            
            guard let countries = countries else { return }
            self.dataSource.countries = countries
            self.delegate.countries = countries
            
            self.reload(self.tableView)
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
        dataSource.countries.sort(by: {$0.name > $1.name})
        self.reload(tableView)
    }
    
    func sortByAreaSize() {
        dataSource.countries.sort(by: {$0 < $1})
        self.reload(tableView)
    }
}

extension CountriesViewController: CountrySelectionDelegate {
    
    func presentBorders(of country: Country) {
        let viewController = UIStoryboard.instantiate(viewController: ViewController.bordersViewController, withStoryboard: Storyboard.borders) as! BordersViewController
        viewController.modalPresentationStyle = .fullScreen
        viewController.country = country
        navigationController?.pushViewController(viewController, animated: true)
    }
}

