//
//  HomePresenter.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomeRouterProtocol?
    
}

// MARK: (View -> Presenter)
extension HomePresenter: HomePresenterProtocol {

    func viewDidLoad() {
        interactor?.getModuleData()
    }
    
    func navigateToSecondScreen() {
        
        guard let view = view else { return }
        
        router?.navigateToSecondScreen(fromVC: view)
    }
    
    func presentSecondScreen() {
        
        guard let view = view else { return }
        
        router?.presentSecondScreen(fromVC: view)
    }
}

// MARK: (Presenter <- Interactor)
extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func setModuleData(name: String) {
        view?.configureUI(name: name)
    }
}
