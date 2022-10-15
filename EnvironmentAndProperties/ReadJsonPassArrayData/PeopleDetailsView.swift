//
//  PeopleDetailsView.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import SwiftUI

struct PeopleDetailsView: View {
    
    @EnvironmentObject var peopleViewModel: PeopleViewModel
    
    let gradientDoseView = Gradient(colors: [.white, .white, Color("OceanGreen").opacity(0.1), .white])
    
    let isAbleToDrive = "not"
    @State var isFormPresented: Bool = false
    
    var columns: [GridItem] = [
        GridItem(.fixed(110), spacing: 10),
        GridItem(.fixed(110), spacing: 10),
        GridItem(.fixed(110), spacing: 10)
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text("Name:")
                                    .bold()
                                    .font(.title)
                                    .frame(width: geo.size.width / 2)
                                Spacer()
                                Divider()
                                    .frame(width: 2, height: 40)
                                    .background(.black)
                                Spacer()
                                
                                Text("Age:")
                                    .bold()
                                    .font(.title)
                                    .frame(width: geo.size.width / 2)
                                Spacer()
                            }
                            
                            NavigationLink(destination: ReadJsonInfoView()) {
                                Text("More Info")
                            }
                            
                        }
                        Divider()
                            .frame(height: 4)
                            .background(.black)
                        
                        // First ForEach for the name & age
                        ForEach(peopleViewModel.people, id: \.firstName) { item in
                            
                            HStack {
                                Spacer()
                                Text("\(item.firstName) \(item.lastName)")
                                    .font(.body)
                                    .frame(width: geo.size.width / 2)
                                Spacer()
                                Divider()
                                    .frame(width: 2, height: 30)
                                    .background(.black)
                                Text("\(item.age)")
                                    .font(.body)
                                    .frame(width: geo.size.width / 2)
                                Spacer()
                            }
                            
                            // Second ForEach to access the Hobbies
                            if item.hasDrivingLicense {
                                Text("This person is able to drive.")
                                    .font(.footnote)
                            } else {
                                Text("This person is \(isAbleToDrive) able to drive.")
                                    .font(.footnote)
                            }
                            
                            LazyVGrid(
                                columns: columns,
                                alignment: .center,
                                spacing: 16,
                                pinnedViews: [.sectionHeaders, .sectionFooters]
                            ) {
                                Section(header: Text("Hobbies")
                                    .font(.title2)
                                    .bold()
                                    .frame(width: geo.size.width)
                                    .background(.green.opacity(0.4))) {
                                        
                                        ForEach(item.hobbies, id: \.self) { hobby in
                                            if !hobby.isEmpty {
                                                HStack {
                                                    Text("•")
                                                        .bold()
                                                    Text("\(hobby)")
                                                        .font(.body)
                                                }
                                            } else {
                                                Text("No Hobbies 😟")
                                            }
                                        }
                                    }
                            }
                            Divider()
                                .frame(height: 2)
                                .background(.orange)
                            Button {
                                if let index = peopleViewModel.people.firstIndex(where: { _item in
                                    return _item.firstName == item.firstName
                                }) {
                                    peopleViewModel.people.remove(at: index)
                                }
                                peopleViewModel.manager.writeJSON(peopleViewModel.people)
                            } label: {
                                Text("Delete")
                                    .foregroundColor(.black)
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                            }
                            .padding()
                            Divider()
                                .frame(height: 8)
                                .background(.black)
                        }
                    }
                    .padding()
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            }
            .navigationBarTitle("Read json")
            .background(AngularGradient(gradient: gradientDoseView, center: .center, angle: .degrees(120)))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                            isFormPresented = true
                        },
                        label: {
                            VStack{
                                Image(systemName: "plus")
                                    .foregroundColor(.brown)
                                Text("write json")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.brown)
                            }
                        }
                    )
                }
            }
            .sheet(isPresented: $isFormPresented) {
                EnterPersonDataView(dataEntryClosureButton: { person in
                    // Data updates on the view when logic placed here
                    peopleViewModel.save(person: person)
                },
                                    resetDataClosureButton: {
                    peopleViewModel.deleteAll()
                })
            }
        }
    }
}

struct PeopleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailsView()
            .environmentObject(PeopleViewModel())
    }
}
