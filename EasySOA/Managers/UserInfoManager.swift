//
//  UserInfoModel.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import Foundation

class UserInfoManager:ObservableObject {
    
    static var shared = UserInfoManager()
    
    @Published var user: UserInfo = UserInfo()
    @Published var isLoading: Bool = false
    
    var userService: UserInfoService
    
    init(service: UserInfoService? = nil) {
        userService = service ?? RussianUserService()
    }
    
    func load() async throws {
        isLoading = true
        do {
            let userInfo = try await userService.load()
            await MainActor.run {
                user = userInfo
                isLoading = false
            }
        } catch {
            await MainActor.run {
                isLoading = false
            }
            throw error
        }
    }
}
