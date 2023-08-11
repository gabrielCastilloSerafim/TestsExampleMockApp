//
//  HomeInteractor.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorToPresenterProtocol?

    // MARK: Methods
    func getModuleData() {
        
        NetWorkService.shared.getMockData { name in
            
            self.presenter?.setModuleData(name: name)
        }
    }
}
