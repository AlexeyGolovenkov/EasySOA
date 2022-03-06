//
//  EnglishVersionHandler.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import Foundation
import AGMockServer

class EnglishVersionHandler: AGMRequestHandler {
    var urlFormat: String = "english"
    
    private lazy var userInfo: UserInfo = {
        UserInfo (
            firstName: "Julius",
            lastName: "Rock",
            likesCount: 12)
    } ()
    
    func defaultData(for url: URL) -> Data {
        return (try? JSONEncoder().encode(userInfo)) ?? Data()
    }
}
