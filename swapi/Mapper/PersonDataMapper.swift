//
//  PersonDataMapper.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit

class PersonDataMapper {
    
    static func dataFromJSON(result: inout [String : String], name: String, url: String) {
        result[name.uppercased()] = url
    }
    
    static func realmFromJSON(name: String, height: String, mass: String, hairColor: String,
                              skinColor: String, eyeColor: String, birthYear: String, gender: String) -> Person {
        let person = Person()
        person.id = PersonService.instance.getAll().count
        person.name = name.uppercased()
        person.height = height
        person.mass = mass
        person.hairColor = hairColor
        person.skinColor = skinColor
        person.eyeColor = eyeColor
        person.birthYear = birthYear
        person.gender = gender       
        return person
    }
    
    static func tableItemsFromRealmObject(_ realmObject: Person) -> [PersonDetailTableItem] {
        var items: [PersonDetailTableItem] = []       
        items.append(PersonDetailTableItem(description: "detail.cell.description.gender".localized, value: realmObject.gender))
        items.append(PersonDetailTableItem(description: "detail.cell.description.height".localized, value: realmObject.height))
        items.append(PersonDetailTableItem(description: "detail.cell.description.mass".localized, value: realmObject.mass))
        items.append(PersonDetailTableItem(description:  "detail.cell.description.birthYear".localized, value: realmObject.birthYear))
        items.append(PersonDetailTableItem(description: "detail.cell.description.hairColor".localized, value: realmObject.hairColor))
        items.append(PersonDetailTableItem(description: "detail.cell.description.skinColor".localized, value: realmObject.skinColor))
        items.append(PersonDetailTableItem(description: "detail.cell.description.eyeColor".localized, value: realmObject.eyeColor))
        return items
    }
    
}
