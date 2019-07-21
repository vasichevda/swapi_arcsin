//
//  SearchRouter.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit

class SearchRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
}

extension SearchRouter: SearchWireframe {
    
    func showDetails(aboutPerson person: Person) {
        let detailController = DetailTableViewController()
        detailController.header = person.name
        detailController.items = PersonDataMapper.tableItemsFromRealmObject(person)      
        view?.navigationController?.pushViewController(detailController, animated: true)        
    }    
    
}

extension SearchRouter: SearchConfigurator {
    
    static func assembleModule() -> UIViewController {
        let view = SearchViewController(nibName: "SearchViewController", bundle: nil)
        let presenter = SearchPresenter()
        let router = SearchRouter()
        let interactor = SearchInteractor()
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        
        interactor.output = presenter
        
        return view
    }
    
}
