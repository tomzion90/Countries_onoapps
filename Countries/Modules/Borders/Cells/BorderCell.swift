//
//  BorderCell.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class BorderCell: UITableViewCell {

    @IBOutlet weak var englishNameLabel: UILabel!
    @IBOutlet weak var nativeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with border: Border) {
        englishNameLabel.text = border.name
        nativeNameLabel.text = border.nativeName
    }
}
