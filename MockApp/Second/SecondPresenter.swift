//
//  SecondPresenter.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import Foundation

class SecondPresenter  {
    
    // MARK: Properties
    weak var view: SecondViewProtocol?
    var interactor: SecondPresenterToInteractorProtocol?
    var router: SecondRouterProtocol?
    
}

// MARK: (View -> Presenter)
extension SecondPresenter: SecondPresenterProtocol {

    func viewDidLoad() {

    }

}

// MARK: (Presenter <- Interactor)
extension SecondPresenter: SecondInteractorToPresenterProtocol {
	
}
