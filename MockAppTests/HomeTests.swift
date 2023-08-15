//
//  HomeTests.swift
//  MockAppTests
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//

import XCTest
@testable import MockApp

final class HomeTests: XCTestCase {
    
    //MARK: SETUP
    var SUT: HomeViewProtocol!
    var homeTestsNetworkService: NetworkProtocol!
    
    override func setUpWithError() throws {
        
        homeTestsNetworkService = TestsNetworkServiceMiddleware()
        SUT = HomeRouter.createModule(netWorkService: homeTestsNetworkService) as? any HomeViewProtocol
    }
    
    override func tearDownWithError() throws {
        
        SUT = nil
        homeTestsNetworkService = nil
        TestsHomeViewControllerMiddleWare.shared.presentedViewController = nil
    }
    
    //MARK: TESTS
    func testViewDidLoad() throws {
        
        /// AAA Pattern  (Arrange, Act, Assert)
        
        // ARRANGE...
        
        // Create expectation to be waited
        let testsNetworkService = try XCTUnwrap(homeTestsNetworkService as? TestsNetworkServiceMiddleware)
        
        let getMockDataExpectation =  XCTestExpectation(description: "Get getMockData expectation")
        getMockDataExpectation.expectedFulfillmentCount = 1
        
        testsNetworkService.expectation = getMockDataExpectation
        
        // ACT...
        
        // Init view lifecycle
        SUT.loadViewIfNeeded()
        
        // Set wait for expectation
        wait(for: [getMockDataExpectation], timeout: 2.0)
        
        // ASSERT...
        
        // When expectation gets fulfilled perform asserts
        XCTAssert(SUT.title == "Anderson", "Failure message")
    }
    
    func testNavigationToSecondScreen() throws {
        
        // ARRANGE...
        let navigationController = TestsNavigationControllerMiddleware(rootViewController: SUT)
        let homeView = try XCTUnwrap(SUT as? HomeView)
        SUT.loadViewIfNeeded()
        
        // ACT...
        homeView.navigateToSecondScreenButton.sendActions(for: .touchUpInside)
        
        // ASSERT...
        XCTAssertTrue(navigationController.pushedVC is SecondView, "Failure message")
    }
    
    func testPresentationOfSecondScreen() throws {
        
        // ARRANGE...
        let homeView = try XCTUnwrap(SUT as? HomeView)
        SUT.loadViewIfNeeded()
        
        // ACT...
        homeView.presentSecondScreenButton.sendActions(for: .touchUpInside)
        
        // ASSERT...
        XCTAssertTrue(TestsHomeViewControllerMiddleWare.shared.presentedViewController is SecondView, "Failure message")
    }
}



// MARK: Home Tests Network Service Middleware
class TestsNetworkServiceMiddleware: NetworkProtocol {
    
    var name: String?
    
    var expectation: XCTestExpectation?
    
    func getMockData(completion: @escaping (String) -> Void) {
        
        NetWorkService.shared.getMockData { name in
            
            self.expectation?.fulfill()
            completion(name)
        }
    }
    
}

// MARK: Tests NavigationController Middleware
class TestsNavigationControllerMiddleware: UINavigationController {
    
    var pushedVC: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        pushedVC = viewController
    }
}

// MARK: Tests HomeViewController Modal Middleware
class TestsHomeViewControllerMiddleWare {
    
    static let shared = TestsHomeViewControllerMiddleWare()
    private init() {}
    
    var presentedViewController: UIViewController?
}

extension HomeView {
    
    override open func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        
        TestsHomeViewControllerMiddleWare.shared.presentedViewController = viewControllerToPresent
    }
}
