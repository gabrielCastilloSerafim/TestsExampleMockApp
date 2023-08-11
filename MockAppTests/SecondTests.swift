//
//  SecondTests.swift
//  MockAppTests
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//

import XCTest
@testable import MockApp

final class SecondTests: XCTestCase {
    
    //MARK: SETUP
    var SUT: SecondViewProtocol!
    
    override func setUpWithError() throws {
        super.setUp()
        
        // Simulate navigation stack
        let navigationController = UINavigationController()
        let previousVC = HomeRouter.createModule()
        
        navigationController.viewControllers = [previousVC]
        
        let secondVC = SecondRouter.createModule() as? any SecondViewProtocol
        
        previousVC.navigationController?.pushViewController(secondVC!, animated: false)
        
        // Set SUT
        SUT = secondVC
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        SUT = nil
    }
    
    //MARK: TESTS
    func testViewNavigation() throws {
        
        SUT.navigateToOtherViewController()
        
        XCTAssert(SUT.navigationController?.viewControllers.last?.title == "OtherViewController", "Failure message")
    }
}
