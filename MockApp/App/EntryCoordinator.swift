//
//  EntryCoordinator.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//

import UIKit

class EntryCoordinator {
    
    func start(navigationController: UINavigationController) {
        
        let planetsView = HomeRouter.createModule()
        planetsView.view.backgroundColor = .white
        navigationController.viewControllers = [planetsView]
    }
}
