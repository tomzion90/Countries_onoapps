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
        case empty
        case networkError
    }
    
    func set(_ state: State) {
        switch state {
        case .loading:
            stateLabel.text = "Loading"
            stateImage.image = UIImage(named: "loading_state")
            activityIndicator.startAnimating()
        case .empty:
            stateLabel.text = "No boarders found"
            stateImage.image = UIImage(named: "empty_state")
            activityIndicator.isHidden = true
        case .networkError:
            stateLabel.text = "No signal found"
            stateImage.image = UIImage(named: "network_error_state")
            activityIndicator.isHidden = true
        }
    }
}
