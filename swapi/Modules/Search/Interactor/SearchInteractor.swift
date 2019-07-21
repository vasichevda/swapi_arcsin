//
//  SearchInteractor.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import Alamofire
import SwiftyJSON


class SearchInteractor {
    
    // MARK: Properties
    
    weak var output: SearchInteractorOutput?
}

extension SearchInteractor: SearchProvider {
    
    func isDictionaryEmpty() -> Bool {
        return PersonService.instance.getDictionary() == nil
    }
    
    func loadDictionary() {
        getDataForDictionary(withUrl: Constants.API_BASE_URL)
    }
    
    private func getDataForDictionary(withUrl url: String, result: [String: String] = [String: String]()) {
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var data = [String: String]()
                json["results"].arrayValue.map { PersonDataMapper.dataFromJSON(result: &data, name: $0["name"].stringValue, url: $0["url"].stringValue) }
                let result = result.merging(data) { (current, _) in current }
                let nextPage = json["next"].stringValue
                if nextPage != "" {
                    self.getDataForDictionary(withUrl: nextPage, result: result)
                } else {                   
                    PersonService.instance.setDictionary(result)
                    self.output?.dictionryLoaded()
                }                
            case .failure(let error):
                self.output?.error(withMessage: error.localizedDescription)
            }
            
        }
    }
    
    func loadPerson(byUrl url: String) {
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let person = PersonDataMapper.realmFromJSON(name: json["name"].stringValue,
                                                            height: json["height"].stringValue,
                                                            mass: json["mass"].stringValue,
                                                            hairColor: json["hair_color"].stringValue,
                                                            skinColor: json["skin_color"].stringValue,
                                                            eyeColor: json["eye_color"].stringValue,
                                                            birthYear: json["birth_year"].stringValue,
                                                            gender: json["gender"].stringValue)
                PersonService.instance.save(person: person)
                self.output?.personLoaded(person)
            case .failure(let error):
                self.output?.error(withMessage: error.localizedDescription)
            }            
        }
    }
    
    func getPersonFromDataBase(byName name: String) -> Person? {
        return PersonService.instance.getByName(name)
    }
    
    func getUrlFromdataBase(byName name: String) -> String? {
        return PersonService.instance.getUrlFromDictionary(byName: name)
    }
    
}
