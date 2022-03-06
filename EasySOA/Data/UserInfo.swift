//
//  UserInfo.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import Foundation

struct UserInfo: Codable {
    var firstName: String
    var lastName: String
    var likesCount: Int
    
    init(firstName: String = "", lastName: String = "", likesCount: Int = 0) {
        self.firstName = firstName
        self.lastName = lastName
        self.likesCount = likesCount
    }
}
