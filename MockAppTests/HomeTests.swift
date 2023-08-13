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
        super.setUp()
        
        homeTestsNetworkService = TestsNetworkService()
        SUT = HomeRouter.createModule(netWorkService: homeTestsNetworkService) as? any HomeViewProtocol
    }
    
    override func tearDownWithError() throws {
        
        SUT = nil
        homeTestsNetworkService = nil
        
        super.tearDown()
    }
    
    //MARK: TESTS
    func testViewDidLoad() throws {
        
        // Create expectation to be waited
        guard let testsNetworkService = homeTestsNetworkService as? TestsNetworkService else {
            
            XCTFail("Could no cast network service")
            return
        }
        
        let getMockDataExpectation =  XCTestExpectation(description: "Get getMockData expectation")
        
        testsNetworkService.expectation = getMockDataExpectation
        
        // Call method
        SUT.presenter?.viewDidLoad()
        
        // Set wait for expectation
        wait(for: [getMockDataExpectation], timeout: 2.0)
        
        // When expectation gets fulfilled perform asserts
        XCTAssert(SUT.view.backgroundColor == .red, "Failure message")
        XCTAssert(SUT.title == "Anderson", "Failure message")
    }
    
}



// MARK: Home Tests Network service
class TestsNetworkService: NetworkProtocol {
    
    var name: String?
    
    var expectation: XCTestExpectation?
    
    func getMockData(completion: @escaping (String) -> Void) {
        
        NetWorkService.shared.getMockData { name in
            
            self.expectation?.fulfill()
            completion(name)
        }
    }
    
}
