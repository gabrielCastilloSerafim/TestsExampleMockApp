//
//  HomeProtocols.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import UIKit

// MARK: (PRESENTER -> VIEW)
protocol HomeViewProtocol: AnyObject, UIViewController {
    
    // MARK: Properties
    var presenter: HomePresenterProtocol? { get set }

    // MARK: Methods
    func configureUI(name: String)
}

// MARK: (PRESENTER -> ROUTER)
protocol HomeRouterProtocol: AnyObject {
    
    // MARK: Methods
    static func createModule() -> UIViewController

}

// MARK: (VIEW -> PRESENTER)
protocol HomePresenterProtocol: AnyObject {

    // MARK: Properties
    var view: HomeViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    // MARK: Methods
    func viewDidLoad()

}

// MARK: (INTERACTOR -> PRESENTER)
protocol HomeInteractorToPresenterProtocol: AnyObject {

    // MARK: Properties

    // MARK: Methods
    func setModuleData(name: String)
}

// MARK: (PRESENTER -> INTERACTOR)
protocol HomePresenterToInteractorProtocol: AnyObject {

    // MARK: Properties
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    
    // MARK: Methods
    func getModuleData()
}

