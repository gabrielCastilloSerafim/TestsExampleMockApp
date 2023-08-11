//
//  SecondRouter.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import UIKit

class SecondRouter: SecondRouterProtocol {

    // MARK: Builder
    static func createModule() -> UIViewController {

        let view: SecondViewProtocol = SecondView()
        let presenter: SecondPresenterProtocol & SecondInteractorToPresenterProtocol = SecondPresenter()
        let interactor: SecondPresenterToInteractorProtocol = SecondInteractor()
        let router: SecondRouterProtocol = SecondRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
            
        return view
    }

    // MARK: Methods
    
}
