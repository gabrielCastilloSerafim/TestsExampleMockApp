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
}

// MARK: (Presenter <- Interactor)
extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func setModuleData(name: String) {
        view?.configureUI(name: name)
    }
}
