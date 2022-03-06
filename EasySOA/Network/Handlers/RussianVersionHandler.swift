//
//  RussianVersionHandler.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import Foundation

import AGMockServer

class RussianVersionHandler: AGMRequestHandler {
    var urlFormat: String = "russian"
    
    private lazy var userInfo: UserInfo = {
        UserInfo (
            firstName: "Юрий",
            lastName: "Каменев",
            likesCount: 400)
    } ()
    
    func defaultData(for url: URL) -> Data {
        return (try? JSONEncoder().encode(userInfo)) ?? Data()
    }
}
