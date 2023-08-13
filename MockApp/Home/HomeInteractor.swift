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
    let netWorkService: NetworkProtocol
    
    init(netWorkService: NetworkProtocol) {
        
        self.netWorkService = netWorkService
    }

    // MARK: Methods
    func getModuleData() {
        
        netWorkService.getMockData { name in
            
            self.presenter?.setModuleData(name: name)
        }
    }
}
