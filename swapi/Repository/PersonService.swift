//
//  PersonService.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import RealmSwift

class PersonService {
   
    private let dictionaryKey = "person.dictionary"
    
    static let instance = PersonService()
    
    let realm = try! Realm()
    
    func getAll() -> Results<Person> {
        return realm.objects(Person.self).sorted(byKeyPath: "id", ascending: false)
    }
    
    func getByName(_ name: String) -> Person? {
        return getAll().filter("name = %@", name.uppercased()).first
    }
    
    func save(person: Person) {
        try! realm.write {
            realm.add(person, update: true)
        }
    }
    
    func setDictionary(_ dictionary: [String : String]) {
        UserDefaults.standard.set(dictionary, forKey: dictionaryKey)
    }
    
    func getDictionary() -> [String : String]? {
        return UserDefaults.standard.value(forKey: dictionaryKey) as? [String : String]
    }
    
    func getUrlFromDictionary(byName name: String) -> String? {
        if let dictionary = getDictionary() {
            return dictionary[name.uppercased()]
        }
        return nil
    }
    
}
