//
//  UserDescription.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

struct UserName {
    
    let name: String
    let password: String
    let secondName: String
    let city: String
    
    static func getUserName() -> UserName {
        UserName(
            name: "Yurii",
            password: "Mal",
            secondName: "Malikov",
            city: "St. Petersburg"
        )
    }
}




