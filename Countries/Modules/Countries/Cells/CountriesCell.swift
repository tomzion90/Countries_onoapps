//
//  CountriesCell.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit
import SVGKit

class CountriesCell: TableViewCell<Country> {
    
    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    override var item: Country! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        englishNameLabel.text = nil
        nativeNameLabel.text = nil
        areaLabel.text = nil
        flagImageView.image = nil
    }
    
    override func fill(with item: Country) {
        super.fill(with: item)
        
        englishNameLabel.text = item.name
        nativeNameLabel.text = item.nativeName
        
        flagImageView.image = UIImage(named: "image_place_holder")
        
        DispatchQueue.global(qos: .utility).async {
            
            if let url = URL(string: item.flag!) {
                let svgFlagImage = SVGKImage(contentsOf: url)
                DispatchQueue.main.async {
                    self.flagImageView.image = svgFlagImage?.uiImage
                }
            }
        }

        guard let area = item.area else {
            areaLabel.text = "0"
            return
        }
        areaLabel.text = "\(area) sq km"
    }
    
}
