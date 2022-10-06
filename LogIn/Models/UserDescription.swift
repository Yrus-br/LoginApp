//
//  UserDescription.swift
//  LogIn
//
//  Created by Jorgen Shiller on 04.10.2022.
//

struct UserDescription {
    
    let login: String
    let password: String
    let person: Person
    
    static func getUsersData() -> UserDescription {
        UserDescription(
            login: "Yurii",
            password: "Mal",
            person: Person.getPersonData()
        )
    }
}
struct Person {
    let name: String
    let secondName: String
    let city: String
    let photo: String
    let bio: String
    static func getPersonData() -> Person {
        Person(
            name: "Yurii",
            secondName: "Mal",
            city: "St. Petesburg",
            photo: "2022-10-05 18.39.49",
            bio: """
            Hi! My name is Yurii, I'm 22. I am the administrator of the online store. I am currently studying on the Swiftbook courses. I have been thinking about starting programming for a long time, I started with JavaScript like many people. I wanted to do mobile development and I thought I could do it with ReactNative, but then I preferred Swift. I studied Swift at Codecademy, but it was a very hard experience. Codecademy has unstructured tutorials even for regular Swift code syntax.  I'm really glad I chose SwiftBook and I hope I can become a good mobile developer.
            """
        )
    }
}




