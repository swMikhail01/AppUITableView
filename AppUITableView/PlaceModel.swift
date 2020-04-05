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
    @objc dynamic var date = Date()
    
    convenience init(name: String, location: String?, tupe: String?, imageData: Data?) {
        self.init()
        self.name = name
        self.location = location
        self.tupe = tupe
        self.imageData = imageData
    }
}

   
    
    
    

