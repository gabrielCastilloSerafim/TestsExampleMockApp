//
//  SecondProtocols.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import UIKit

// MARK: (PRESENTER -> VIEW)
protocol SecondViewProtocol: AnyObject, UIViewController {
    
    // MARK: Properties
    var presenter: SecondPresenterProtocol? { get set }

    // MARK: Methods
    func navigateToOtherViewController()
}

// MARK: (PRESENTER -> ROUTER)
protocol SecondRouterProtocol: AnyObject {
	
    // MARK: Methods
    static func createModule() -> UIViewController

}

// MARK: (VIEW -> PRESENTER)
protocol SecondPresenterProtocol: AnyObject {

    // MARK: Properties
    var view: SecondViewProtocol? { get set }
    var interactor: SecondPresenterToInteractorProtocol? { get set }
    var router: SecondRouterProtocol? { get set }
    
    // MARK: Methods
    func viewDidLoad()

}

// MARK: (INTERACTOR -> PRESENTER)
protocol SecondInteractorToPresenterProtocol: AnyObject {

    // MARK: Properties

    // MARK: Methods

}

// MARK: (PRESENTER -> INTERACTOR)
protocol SecondPresenterToInteractorProtocol: AnyObject {

    // MARK: Properties
    var presenter: SecondInteractorToPresenterProtocol? { get set }
    
    // MARK: Methods

}
