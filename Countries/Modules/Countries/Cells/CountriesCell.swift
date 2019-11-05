//
//  CountriesCell.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class CountriesCell: UITableViewCell {
    
    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        configure()
    }
    
    func configure() {
        
    }
}
