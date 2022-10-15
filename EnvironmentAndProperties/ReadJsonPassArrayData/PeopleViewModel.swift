//
//  PeopleViewModel.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import Foundation
import SwiftUI

class PeopleViewModel: ObservableObject {
    
    //Reference this file for Reading and Writing to json using the Generic JsonManager
    
    let manager = try! JsonManager(path: "personData", location: .documents)
    
    @Published var people: [Person] = []
    
    init() {
        manager.readJSON() { (response: Result<[Person], Error>) in
            switch response {
            case let .success(people):
                self.people = people
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func save(person: Person) {
        people.append(person)
        manager.writeJSON(people)
    }
    
    func deleteAll() {
        people.removeAll()
        manager.writeJSON(people)
    }
    
    
    func removePerson(item: Person) {
        if let index = people.firstIndex(where: { _item in
            return _item.firstName == item.firstName
        }) {
            people.remove(at: index)
        }
        manager.writeJSON(people)
    }
    
    
}

