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
    @IBOutlet weak var flagImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func prepareForReuse() {
        flagImageView.sd_cancelCurrentImageLoad()
        flagImageView.image = nil
    }
    
    func fill(with country: Country) {
        
        englishNameLabel.text = country.name
        nativeNameLabel.text = country.nativeName
    }
}
