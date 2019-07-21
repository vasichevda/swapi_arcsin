//
//  FavoriteRouter.swift
//  swapi
//
//  Created by Denis Vasichev on 20/07/2019.
//  Copyright © 2019 Denis Vasichev. All rights reserved.
//

import UIKit

class FavoriteRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
}

extension FavoriteRouter: FavoriteWireframe {
    
    func showDetails(aboutPerson person: Person) {
        let detailController = DetailTableViewController()
        detailController.header = person.name
        detailController.items = PersonDataMapper.tableItemsFromRealmObject(person)
        view?.navigationController?.pushViewController(detailController, animated: true)
    }
   
}

extension FavoriteRouter: FavoriteConfigurator {
    
    static func assembleModule() -> UIViewController {
        let view = FavoriteTableViewController(nibName: "FavoriteTableViewController", bundle: nil)
        let presenter = FavoritePresenter()
        let router = FavoriteRouter()
        let interactor = FavoriteInteractor()
        
        view.presenter =  presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = view
        
        interactor.output = presenter
        
        return view
    }
    
}
