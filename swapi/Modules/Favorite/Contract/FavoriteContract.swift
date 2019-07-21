//
//  FavoriteContract.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit

protocol FavoriteView: class {
    
    func reloadData(withItems items: [String])
    
}

protocol FavoritePresentation: class {    
   
    func viewWillAppear()
    func didSelectItem(withName name: String)
    
}

protocol FavoriteInteractorOutput: class {
    
    func dataLoaded(_ personNames: [String])
    
}

protocol FavoriteProvider: class {
    
    func getData()
    func getPerson(byName name: String) -> Person?
    
}

protocol FavoriteWireframe: class {
    
    func showDetails(aboutPerson person: Person)
    
}

protocol FavoriteConfigurator: class {
    
    static func assembleModule() -> UIViewController
    
}
