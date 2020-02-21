//
//  User.swift
//  ExampleClenARC
//
//  Created by Miguel Barone - MBA on 12/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

struct UserAPIResponse: Codable {
    let email: String
    let age: Int
    let birthday: Date
}

extension UserAPIResponse {
    func map() -> UserResponse {
    return UserResponse(email: self.email)
    }
}
