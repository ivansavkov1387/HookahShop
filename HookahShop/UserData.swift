//
//  UserData.swift
//  HookahShop
//
//  Created by Иван on 4/15/21.
//

import Foundation


struct UserData {
    let name: String
    let password: String
    
    static func getUserData() -> UserData {
        UserData(name: "1", password: "1")
    }
}
