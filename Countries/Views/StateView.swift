//
//  StateView.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

class StateView: UIView {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    enum State {
        case loading
        case noBoarders
        case networkError
    }
    
    func set(_ state: State) {
        switch state {
        case .loading:
            stateLabel.text = "Loading"
            activityIndicator.startAnimating()
        case .noBoarders:
            stateLabel.text = "No boarders found"
            activityIndicator.isHidden = true
        case .networkError:
            stateLabel.text = "No signal found"
            activityIndicator.isHidden = true
        }
    }
}
