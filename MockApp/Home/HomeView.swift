//
//  HomeView.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//  
//

import UIKit

class HomeView: UIViewController {

    // MARK: Properties

    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

    // MARK: Methods

}

// MARK: (View <- Presenter)
extension HomeView: HomeViewProtocol {
    
    func configureUI(name: String) {
        title = name
        view.backgroundColor = .red
    }
}
