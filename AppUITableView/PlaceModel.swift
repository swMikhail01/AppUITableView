//
//  PlaceModel.swift
//  AppUITableView
//
//  Created by Михаил on 29.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import RealmSwift

class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var tupe: String?
    @objc dynamic var imageData: Data?
     
   
    
    let restaurantNames = ["Bonsai", "Burger Heroes", "Kitchen", "Hrurlnya"]
    
    func savePlaces() {
        
        
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            
       let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "kameb"
            newPlace.tupe = "bar"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
       }
      
        
    }
}
