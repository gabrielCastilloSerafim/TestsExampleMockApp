//
//  SecondView.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import UIKit

class SecondView: UIViewController {

    // MARK: Properties

    var presenter: SecondPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: Methods

}

// MARK: (View <- Presenter)
extension SecondView: SecondViewProtocol {
    
    func navigateToOtherViewController() {
        
        let otherViewController = UIViewController()
        otherViewController.title = "OtherViewController"
        
        self.navigationController?.pushViewController(otherViewController, animated: false)
    }
}
