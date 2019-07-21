//
//  FavoriteInteractor.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import Alamofire
import SwiftyJSON


class FavoriteInteractor {
    
    // MARK: Properties
    
    weak var output: FavoriteInteractorOutput?
}

extension FavoriteInteractor: FavoriteProvider {
    
    func getData() {
        let persons = PersonService.instance.getAll()
        let personNames = persons.map { $0.name }
        output?.dataLoaded(Array(personNames))
    }
    
    func getPerson(byName name: String) -> Person? {
        return PersonService.instance.getByName(name)
    }
    
    
}
