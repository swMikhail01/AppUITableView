//
//  PlaceModel.swift
//  AppUITableView
//
//  Created by Михаил on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import UIKit

struct Place {
    
    var name: String?
    var location: String?
    var tupe: String?
    var image: UIImage?
    var restaurantImage: String?
    
   static let restaurantNames = ["Bonsai", "Burger Heroes", "Kitchen", "Hrurlnya"]
    
   static func getPlaces() -> [Place] {
        
        var places = [Place]()
        
        for place in restaurantNames {
            places.append(Place(name: place, location: "kamenb", tupe: "bar", image: nil, restaurantImage: place))
        
       
        
       
       }
         return places
        
    }
}
