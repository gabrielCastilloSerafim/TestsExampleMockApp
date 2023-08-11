//
//  NetworkService.swift
//  MockApp
//
//  Created by Gabriel Castillo Serafim on 10/8/23.
//

import Foundation

class NetWorkService: NetworkProtocol {
    
    static var shared = NSClassFromString("XCTest") == nil ?
        NetWorkService() as NetworkProtocol :
        MockNetworkService() as NetworkProtocol
    
    private init() {}
    
    var name: String?
    
    func getMockData(completion: @escaping (String) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(800)) {
            self.name = "Gabriel"
            completion("Gabriel")
        }
    }
}

class MockNetworkService: NetworkProtocol {
    
    var name: String?
    
    func getMockData(completion: @escaping (String) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(800)) {
            self.name = "Anderson"
            completion("Anderson")
        }
    }
}

protocol NetworkProtocol {
    
    var name: String? { get set }
    
    func getMockData(completion: @escaping (String) -> Void)
}
