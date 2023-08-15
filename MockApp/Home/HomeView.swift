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
    
    // MARK: UIProperties
    internal lazy var navigateToSecondScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Navigate to second screen", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(navigateToSecondScreen), for: .touchUpInside)
        return button
    }()
    
    internal lazy var presentSecondScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Present second screen", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(presentSecondScreen), for: .touchUpInside)
        return button
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter?.viewDidLoad()
    }

    // MARK: Methods

    private func setupUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(navigateToSecondScreenButton)
        view.addSubview(presentSecondScreenButton)
        navigateToSecondScreenButton.translatesAutoresizingMaskIntoConstraints = false
        presentSecondScreenButton.translatesAutoresizingMaskIntoConstraints = false
        
        // navigateToSecondScreenButton
        NSLayoutConstraint(
            item: navigateToSecondScreenButton, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: navigateToSecondScreenButton, attribute: .centerY, relatedBy: .equal,
            toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: navigateToSecondScreenButton, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 52).isActive = true
        
        NSLayoutConstraint(
            item: navigateToSecondScreenButton, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 250).isActive = true
        
        // presentSecondScreenButton
        NSLayoutConstraint(
            item: presentSecondScreenButton, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: presentSecondScreenButton, attribute: .centerY, relatedBy: .equal,
            toItem: view, attribute: .centerY, multiplier: 1, constant: 100).isActive = true
        
        NSLayoutConstraint(
            item: presentSecondScreenButton, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 52).isActive = true
        
        NSLayoutConstraint(
            item: presentSecondScreenButton, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 250).isActive = true
    }
    
    @objc func navigateToSecondScreen() {
        presenter?.navigateToSecondScreen()
    }
    
    @objc func presentSecondScreen() {
        presenter?.presentSecondScreen()
    }
}

// MARK: (View <- Presenter)
extension HomeView: HomeViewProtocol {
    
    func configureUI(name: String) {
        title = name
    }
}
