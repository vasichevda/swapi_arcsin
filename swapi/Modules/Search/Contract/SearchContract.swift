//
//  SearchContract.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit

protocol SearchView: class {
    
    func showProgress()
    func hideProgress()
    func showInfoLabel(withText text: String)
    func hideInfoLabel()
    
}

protocol SearchPresentation: class {
    
    func loadDictionary()
    func searchButtonClick(withText text: String?)
    
}

protocol SearchInteractorOutput: class {
    
    func dictionryLoaded()
    func personLoaded(_ person: Person)
    func error(withMessage message: String)
    
}

protocol SearchProvider: class {
    
    func isDictionaryEmpty() -> Bool
    func loadDictionary()
    func loadPerson(byUrl url: String)
    func getPersonFromDataBase(byName name: String) -> Person?
    func getUrlFromdataBase(byName name: String) -> String?
    
}

protocol SearchWireframe: class {
    
    func showDetails(aboutPerson person: Person)
    
}

protocol SearchConfigurator: class {
    
    static func assembleModule() -> UIViewController
    
}
