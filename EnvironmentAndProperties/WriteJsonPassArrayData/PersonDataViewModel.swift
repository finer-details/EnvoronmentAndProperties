//
//  PersonDataViewModel.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 01/10/2022.
//

import Foundation

class PersonDataViewModel: ObservableObject {
    
    let userManager = UserManager()
    
    @Published var firstName: String = ""
    @Published var surname: String = ""
    @Published var age: String = ""
    @Published var canDrive: String = ""
    @Published var hobbies: String = ""
    @Published var hobbiesArray: Array = [String]()
    
    func save() {
        let person = Person(firstName: firstName,
                            lastName: surname,
                            age: Int(age) ?? 0,
                            hasDrivingLicense: Bool(canDrive) ?? false,
                            hobbies: hobbiesArray)
        userManager.addPerson(person: person)
    }
    
}
