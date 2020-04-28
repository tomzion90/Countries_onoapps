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
    
    func fetchCountries(completion: @escaping (Result<[Country], Error>) -> Void) {
        let urlString = "https://restcountries.eu/rest/v2/all"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchBorders(searchTerm: String, completion: @escaping (Result<[Border], Error>) -> Void) {
        
        let urlString = "https://restcountries.eu/rest/v2/alpha?codes=\(searchTerm)"
        fetchData(urlString: urlString, completion: completion)
        
    }
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            
            do {
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    }
                    return
            }
                let countries = try JSONDecoder().decode(T.self, from: data)
                completion(.success(countries))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
