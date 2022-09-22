//
//  Person.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import Foundation

struct Person: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let hasDrivingLicense: Bool
    var hobbies: [String]
}

struct Hobbies: Decodable {
    let name: String
}

