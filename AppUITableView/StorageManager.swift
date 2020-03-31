//
//  StorageManager.swift
//  AppUITableView
//
//  Created by Михаил on 31.03.2020.
//  Copyright © 2020 Mikhail. All rights reserved.
//

import RealmSwift

 let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place){
        try! realm.write {
            realm.add(place)
        }
    }
}
