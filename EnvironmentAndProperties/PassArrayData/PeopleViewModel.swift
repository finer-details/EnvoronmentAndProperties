//
//  PeopleViewModel.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import Foundation
import SwiftUI

class PeopleViewModel: ObservableObject {
    
    let manager = try! JsonManager(path: "personData", location: .local)
    
    @Published var people: [Person] = [
        //            .init(firstName: "David", lastName: "Devlin", age: 42, hasDrivingLicense: true, hobbies: [
        //                .init(name: "Coding"), .init(name: "Walking"), .init(name: "Technology")
        //            ]),
        //            .init(firstName: "Luke", lastName: "Devlin", age: 11, hasDrivingLicense: false, hobbies: [
        //                .init(name: "Playing"), .init(name: "Lego"), .init(name: "Electronics")
        //            ])
//        Person(firstName: "Bob", lastName: "Smith", age: 91, hasDrivingLicense: true, hobbies: ["Walking"])
    ]
    
    init() {
        manager.readJSON() { (response: Result<[Person], Error>) in
            switch response {
            case let .success(people):
                self.people = people
//                writeDatatoJson()
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func writeDatatoJson() {
        self.people.append(contentsOf: people)
        self.people.removeAll()
        self.manager.writeJSON(self.people)
    }
    
}

