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
    
    func fetchData(completion: @escaping ([Country]?, Error?) -> Void) {
        let urlString = "https://restcountries.eu/rest/v2/all"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            do {
                guard let data = data else { return }
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completion(countries, nil)
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
    
    func fetchBorders(searchTerm: String, completion: @escaping ([Border]?, Error?) -> Void) {
        
        let urlString = "https://restcountries.eu/rest/v2/alpha?codes=\(searchTerm)"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            do {
                guard let data = data else { return }
                let borders = try JSONDecoder().decode([Border].self, from: data)
                completion(borders, nil)
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
}
