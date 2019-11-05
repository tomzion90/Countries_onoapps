//
//  StateView.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit

protocol stateViewDidTapActionDelegate: class {
    func stateViewDidTapActionButton()
}

class StateView: UIView {
    
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var actionButton: UIButton!
    
    
    weak var delegate: stateViewDidTapActionDelegate?
    
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
            actionButton.isHidden = true
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .empty:
            stateLabel.text = "No boarders found"
            stateImage.image = UIImage(named: "empty_state")
            actionButton.isHidden = true
            activityIndicator.isHidden = true
        case .networkError:
            stateLabel.text = "No signal found"
            stateImage.image = UIImage(named: "network_error_state")
            actionButton.isHidden = false
            activityIndicator.isHidden = true
        }
    }
    
    @IBAction func didTapActionButton(_ sender: Any) {
        delegate?.stateViewDidTapActionButton()
    }
    
}
