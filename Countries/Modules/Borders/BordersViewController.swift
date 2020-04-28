//
//  BordersViewController.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class BordersViewController: TableView<BorderCell, Border> {
    
    let delegate = BordersTableViewDelegate()
    
    var country: Country?
    var searchTerm: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchTerm()
        fetchBorders(searchTerm: searchTerm)
    }
    
    override func configure() {
        super.configure()
        
        configureTableView(with: delegate, estimatedRowHeight: 300, automaticDimensionRowHeight: true)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
        
        tableView.register(cellType: MapCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
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
    
    private func fetchBorders(searchTerm: String) {
        let stateView = StateView.loadFromNib()
        stateView?.delegate = self
        tableView.separatorStyle = .none
        stateView?.set(.loading)
        tableView.backgroundView = stateView
        
        if searchTerm.isEmpty {
            stateView?.set(.empty)
            tableView.isScrollEnabled = false
            return
        }
        
        Service.shared.fetchBorders(searchTerm: searchTerm) { result in
            switch result {
            case .success(let borders):
                self.items = borders
            case .failure(let error):
                stateView?.set(.networkError)
            }
            self.tableView.reloadData()
            self.tableView.backgroundView = nil
            self.tableView.separatorStyle = .singleLine
        }
    }
}

extension BordersViewController: stateViewDidTapActionDelegate {
    
    func stateViewDidTapActionButton() {
        self.fetchBorders(searchTerm: searchTerm)
    }
}

extension BordersViewController {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let country = country else { return "" }
        
        if self.country?.latlng?.count != 0 && section == 0 {
            return "\(country.name)׳s Map"
        } else {
            return "\(country.name)׳s Borders"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if self.country?.latlng?.count != 0 {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.country?.latlng?.count != 0 && section == 0 {
            return 1
        }
        
        return super.tableView(tableView, numberOfRowsInSection: items.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.country?.latlng?.count != 0 && indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(MapCell.self)", for: indexPath) as! MapCell
            guard let country = country else { return cell}
            cell.fill(with: country)
            return cell
        }
        
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
}
