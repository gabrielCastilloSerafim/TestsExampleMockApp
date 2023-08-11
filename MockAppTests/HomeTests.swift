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
    var testsQueue = DispatchQueue(label: Bundle.main.bundleIdentifier ?? "testsQueue")
    
    override func setUpWithError() throws {
        super.setUp()
        
        SUT = HomeRouter.createModule() as? any HomeViewProtocol
    }
    
    override func tearDownWithError() throws {
        
        SUT = nil
        
        super.tearDown()
    }
    
    //MARK: TESTS
    func testViewDidLoad() throws {
        
        // Call method
        SUT.presenter?.viewDidLoad()
        
        // Create expectation to be waited
        let myExpectation = XCTestExpectation(description: "Get getMockData expectation")
        
        // Enable expectation for needed time
        testsQueue.asyncAfter(deadline: .now() + 2) {
            
            myExpectation.fulfill()
        }
        
        // Set wait for expectation
        wait(for: [myExpectation])
        
        // When expectation gets fulfilled perform asserts
        XCTAssert(SUT.view.backgroundColor == .red, "Failure message")
        XCTAssert(SUT.title == "Anderson", "Failure message")
    }
    
}
