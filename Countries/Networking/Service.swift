//
//  Service.swift
//  Countries
//
//  Created by Tom Zion on 05/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import Foundation
import UIKit

class Service {
    
    static let shared = Service()
    
    let urlString = "https://restcountries.eu/rest/v2/all"
    
    func fetchData(completion: @escaping ([Country]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                completion(countries, nil)
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
}
