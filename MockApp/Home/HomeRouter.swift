//
//  HomeRouter.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import UIKit

class HomeRouter: HomeRouterProtocol {

    // MARK: Builder
    static func createModule() -> UIViewController {

        let view: HomeViewProtocol = HomeView()
        let presenter: HomePresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomeRouterProtocol = HomeRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
            
        return view
    }

    // MARK: Methods
    
}
