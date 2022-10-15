//
//  Person.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import Foundation

struct Person: Codable {
    let firstName: String
    let lastName: String
    let age: Int
    let hasDrivingLicense: Bool
    var hobbies: [String]
}

struct Hobbies: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
}

