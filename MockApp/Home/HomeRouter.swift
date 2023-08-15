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
    static func createModule(netWorkService: NetworkProtocol = NetWorkService.shared) -> UIViewController {

        let view: HomeViewProtocol = HomeView()
        let presenter: HomePresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor(netWorkService: netWorkService)
        let router: HomeRouterProtocol = HomeRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
            
        return view
    }

    // MARK: Methods
    func navigateToSecondScreen(fromVC: UIViewController) {
        
        let secondScreenVC = SecondRouter.createModule()
        
        fromVC.navigationController?.pushViewController(secondScreenVC, animated: true)
    }
    
    func presentSecondScreen(fromVC: UIViewController) {
        
        let secondScreenVC = SecondRouter.createModule()
        
        fromVC.present(secondScreenVC, animated: true)
    }
}
