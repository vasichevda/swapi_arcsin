//
//  FavoritePresenter.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

class FavoritePresenter {
    
    // MARK: Properties
    
    weak var view: FavoriteView?
    var router: FavoriteWireframe?
    var interactor: FavoriteProvider?
}

extension FavoritePresenter: FavoritePresentation { 
    
    func viewWillAppear() {
        interactor?.getData()
    }
    
    func didSelectItem(withName name: String) {
        if let person = interactor?.getPerson(byName: name) {
            router?.showDetails(aboutPerson: person)
        }
    }
    
}

extension FavoritePresenter: FavoriteInteractorOutput {
    
    func dataLoaded(_ personNames: [String]) {
        view?.reloadData(withItems: personNames)        
    }
    
}
