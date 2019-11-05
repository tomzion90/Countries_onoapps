//
//  UIView.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public static func loadFromNib(withFrame frame: CGRect? = nil, identifier: String? = nil, bundle: Bundle = Bundle.main) -> Self? {
        guard let view = bundle.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as? Self else { return nil }
        view.frame = frame ?? view.frame
        return view
    }
}
