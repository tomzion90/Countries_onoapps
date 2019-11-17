//
//  MapCell.swift
//  Countries
//
//  Created by Tom Zion on 06/11/2019.
//  Copyright © 2019 Tom Zion. All rights reserved.
//

import UIKit
import MapKit

class MapCell: UITableViewCell {

    @IBOutlet weak var countryMap: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDegrees = 1000000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        countryMap.setRegion(coordinateRegion, animated: true)
    }
    
    func fill(with country: Country){
        
        guard let lanlng = country.latlng else { return }
        let latitude = lanlng[0]
        let longitude = lanlng[1]
        
        let initialLocation = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        centerMapOnLocation(location: initialLocation)
        
    }
    
}
