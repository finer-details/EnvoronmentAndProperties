//
//  EnterDataSheetView.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 22/09/2022.
//

import SwiftUI

struct EnterPersonDataView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var dataEntryClosureButton: (_ : Person) -> Void
    var resetDataClosureButton: (_ : Person) -> Void
    
    @State private var firstName: String = ""
    @State private var surname: String = ""
    @State private var age: String = ""
    @State private var canDrive: String = ""
    @State private var hobbies: String = ""
    @State private var hobbiesArray: Array = [String]()
    
    var body: some View {
        VStack {
            Text("Enter Person's Details")
                .font(.title)
                .bold()
                .foregroundColor(.brown)
                .padding()
            TextField("First Name:", text: $firstName)
                .modifier(TextFieldModifier())
            TextField("Surname:", text: $surname)
                .modifier(TextFieldModifier())
            TextField("Age:", text: $age)
                .modifier(TextFieldModifier())
                .keyboardType(.numberPad)
            TextField("Can person drive?", text: $canDrive)
                .modifier(TextFieldModifier())
                .autocapitalization(.none)
            HStack(alignment: .top, spacing: 10) {
            TextField("Hobbies:", text: $hobbies)
                .modifier(TextFieldModifier())
                .padding(.leading, 55)
                Button {
                    hobbiesArray.append(hobbies)
                        hobbies = ""
                } label: {
                    Image(systemName: "plus")
                }
                .frame(width: 44, height: 44, alignment: .center)
            }
            Button {
                let personEntry = Person(firstName: firstName, lastName: surname, age: Int(age) ?? 0, hasDrivingLicense: Bool(canDrive) ?? false, hobbies: hobbiesArray)
                dataEntryClosureButton(personEntry)
                dismiss()
            } label: {
                Text("Submit")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                    .background(.green.opacity(0.7))
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.black, lineWidth: 1.0))
            }
            Button {
                let delete = Person(firstName: "", lastName: "", age: 0, hasDrivingLicense: false, hobbies: [])
                resetDataClosureButton(delete)
                dismiss()
            } label: {
                Text("Clear json file")
                    .font(.title3)
                    .foregroundColor(.black)
                    .padding()
                    .background(.red.opacity(0.5))
                    .cornerRadius(18)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.black, lineWidth: 1.5))
            }
            .padding(.top, 20)
        }
    }
}

struct EnterPersonDataView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPersonDataView(dataEntryClosureButton: { _ in }, resetDataClosureButton: { _ in })
    }
}
