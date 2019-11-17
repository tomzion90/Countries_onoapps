//
//  BorderCell.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class BorderCell: TableViewCell<Border> {
    
    override var item: Border! {
        didSet {
            
        }
    }

    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func fill(with item: Border) {
        super.fill(with: item)
        englishNameLabel.text = item.name
        nativeNameLabel.text = item.nativeName
    }
}
