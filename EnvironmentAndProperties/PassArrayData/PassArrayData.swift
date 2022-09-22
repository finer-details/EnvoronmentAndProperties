//
//  PassArrayData.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 20/09/2022.
//

import SwiftUI

struct PassArrayData: View {
    
    var peopleViewModel = PeopleViewModel()
    
    @State var isAbleToDrive: String = "not"
    
    var columns: [GridItem] = [
        GridItem(.fixed(110), spacing: 10),
        GridItem(.fixed(110), spacing: 10),
        GridItem(.fixed(110), spacing: 10)
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
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
                    Divider()
                        .frame(height: 4)
                        .background(.black)
                    
                    // First ForEach for the name & age
                    ForEach(peopleViewModel.people, id: \.firstName) { item in
                        HStack {
                            Spacer()
                            Text("\(item.firstName) \(item.lastName)")
                                .font(.callout)
                                .frame(width: geo.size.width / 2)
                            Spacer()
                            Divider()
                                .frame(width: 5, height: 30)
                                .background(.black)
                            Text("\(item.age)")
                                .font(.callout)
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
                                        HStack {
                                            Text("•")
                                                .bold()
                                            Text("\(hobby)")
                                                .font(.body)
                                        }
                                    }
                                }
                        }
                        Divider()
                            .frame(height: 4)
                            .background(.orange)
                            .padding()
                        Divider()
                            .frame(height: 2)
                            .background(.black)
                    }
                    
                }.padding()
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

struct PassArrayData_Previews: PreviewProvider {
    static var previews: some View {
        PassArrayData()
    }
}
