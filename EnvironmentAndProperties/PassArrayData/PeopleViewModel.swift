//
//  PeopleViewModel.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import Foundation
import SwiftUI

class PeopleViewModel: ObservableObject {
    
    let manager = JsonManager()
    
    let pathString = "personData"
    
    @Published var people: [Person] = [
        //            .init(firstName: "David", lastName: "Devlin", age: 42, hasDrivingLicense: true, hobbies: [
        //                .init(name: "Coding"), .init(name: "Walking"), .init(name: "Technology")
        //            ]),
        //            .init(firstName: "Luke", lastName: "Devlin", age: 11, hasDrivingLicense: false, hobbies: [
        //                .init(name: "Playing"), .init(name: "Lego"), .init(name: "Electronics")
        //            ])
    ]
    init() {
        manager.readJSON(path: pathString, location: .local) { (response: Result<[Person], Error>) in
            self.people = self.people
            switch response {
            case let .success(people):
                self.people = people
            case let .failure(error):
                print(error)

            }
        }
    }
    
}

