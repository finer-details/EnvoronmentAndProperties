//
//  UserManager.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 29/09/2022.
//

//Reference this file for Reading and Writing to json using the Generic JsonManager

import Foundation

class UserManager: ObservableObject {
    
    @Published var people: [Person] = []
    
    static let manager = try! JsonManager(path: "personData", location: .documents)
    
    func addPerson(person: Person) {
        people.append(person)
        UserManager.manager.writeJSON(people)
    }
    
    
    func deleteAll() {
        people.removeAll()
        UserManager.manager.writeJSON(people)
    }
    
    
    // remove a particular entry
    func removePerson(item: Person) {
        if let index = people.firstIndex(where: { _item in
            return _item.firstName == item.firstName
        }) {
            people.remove(at: index)
        }
        UserManager.manager.writeJSON(people)
    }
    
}

