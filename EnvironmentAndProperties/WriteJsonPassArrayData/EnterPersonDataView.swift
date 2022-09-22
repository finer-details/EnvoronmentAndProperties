//
//  EnterDataSheetView.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 22/09/2022.
//

import SwiftUI

struct EnterPersonDataView: View {
    
    var viewModel: PeopleViewModel
    
    var buttonTapped: ((_ person: Person) -> Void)
    
    var body: some View {
        VStack {
            Text("Enter Person Data View")
            Button {
                // TODO: create TextFields, gather all information and have it setup for appending.
                let person: Person = .init(firstName: "David from another view", lastName: "afesga", age: 34, hasDrivingLicense: true, hobbies: ["Walking"])
                buttonTapped(person)
                //writeDatatoJson()
                viewModel.people.append(person)
                viewModel.manager.writeJSON(person)
            } label: {
                Text("Submit")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(.green.opacity(0.7))
            }

        }
    }
    
    func writeDatatoJson() {
        viewModel.people.append(contentsOf: viewModel.people)
//        self.people.removeAll()
        viewModel.manager.writeJSON(viewModel.people)
    }
    
}

struct EnterPersonDataView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPersonDataView(viewModel: PeopleViewModel(), buttonTapped: { _ in })
    }
}
