//
//  UserInfoServices.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import Foundation

protocol UserInfoService {
    func load() async throws -> UserInfo
}

class RussianUserService: UserInfoService {
    func load() async throws -> UserInfo {
        return try await NetworkService.shared.russianUser()
    }
}

class EnglishUserService: UserInfoService {
    func load() async throws -> UserInfo {
        return try await NetworkService.shared.englishUser()
    }
}

class ErrorService: UserInfoService {
    func load() async throws -> UserInfo {
        return try await NetworkService.shared.errorUser()
    }
}
