//
//  SearchPresenter.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

class SearchPresenter {
    
    // MARK: Properties
    
    weak var view: SearchView?
    var router: SearchWireframe?
    var interactor: SearchProvider?
}

extension SearchPresenter: SearchPresentation {
    
    func loadDictionary() {
        if interactor?.isDictionaryEmpty() ?? true {
            view?.showProgress()
            view?.showInfoLabel(withText: "search.infoLabel.text.firstStart".localized)
            interactor?.loadDictionary()
        }     
    }
    
    func searchButtonClick(withText text: String?) {
        if let text = text {
            let name = text.trimmingCharacters(in: .whitespacesAndNewlines)
            if let personInDataBase = interactor?.getPersonFromDataBase(byName: name) {
                router?.showDetails(aboutPerson: personInDataBase)
            } else if let urlPersonInDictionary = interactor?.getUrlFromdataBase(byName: name) {
                interactor?.loadPerson(byUrl: urlPersonInDictionary)
            } else {
                view?.showInfoLabel(withText: "search.infoLabel.text.noResults".localized)
            }
        }
    }
    
}

extension SearchPresenter: SearchInteractorOutput {
    
    func personLoaded(_ person: Person) {       
        router?.showDetails(aboutPerson: person)
    }
    
    func dictionryLoaded() {
        view?.hideProgress()
        view?.hideInfoLabel()
    }   
    
    func error(withMessage message: String) {
        view?.hideProgress()
        view?.showInfoLabel(withText: message)
    }
   
}
