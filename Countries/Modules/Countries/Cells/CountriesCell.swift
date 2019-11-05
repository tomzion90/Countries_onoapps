//
//  CountriesCell.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit
import SDWebImage

class CountriesCell: UITableViewCell {
    
    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with country: Country) {
        
        englishNameLabel.text = country.name
        nativeNameLabel.text = country.nativeName
        
            guard let area = country.area else {
                areaLabel.text = "0"
                return
            }
            areaLabel.text = "\(area)"
        }
    }
