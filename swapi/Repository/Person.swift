//
//  Person.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import RealmSwift

class Person: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var height = ""
    @objc dynamic var mass = ""
    @objc dynamic var hairColor = ""
    @objc dynamic var skinColor = ""
    @objc dynamic var eyeColor = ""
    @objc dynamic var birthYear = ""
    @objc dynamic var gender = ""   
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
