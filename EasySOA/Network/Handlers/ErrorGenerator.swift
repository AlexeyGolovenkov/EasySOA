//
//  ErrorGenerator.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 06.03.2022.
//

import Foundation

import AGMockServer

class ErrorGenerator: AGMRequestHandler {
    var urlFormat: String = "error"
    
    func defaultData(for url: URL) -> Data {
        let response: [String: String] = ["Wrong field": "Wring value"]
        return (try? JSONEncoder().encode(response)) ?? Data()
    }
}
