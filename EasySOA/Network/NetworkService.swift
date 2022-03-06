//
//  NetworkService.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import Foundation
import AGMockServer

class NetworkService {
    
    enum NetworkError: Error {
        case wrongUrl
    }
    
    static var shared = NetworkService()
    
    private var session: URLSession
    
    init() {
        session = AGMockServer.shared.hackedSession(for: URLSession.shared)
        AGMockServer.shared.registerHandler(RussianVersionHandler())
        AGMockServer.shared.registerHandler(EnglishVersionHandler())
        AGMockServer.shared.registerHandler(ErrorGenerator())
    }
    
    func russianUser() async throws -> UserInfo {
        return try await response(from: "https://localhost/russian")
    }
    
    func englishUser() async throws -> UserInfo {
        return try await response(from: "https://localhost/english")
    }
    
    func errorUser() async throws -> UserInfo {
        return try await response(from: "https://localhost/error")
    }
    
    private func response(from path: String) async throws -> UserInfo {
        guard let url = URL(string: path) else {
            throw NetworkError.wrongUrl
        }
        let (data, _) = try await session.data(from: url)
        sleep(1)
        let userInfo = try JSONDecoder().decode(UserInfo.self, from: data)
        return userInfo
    }
}
