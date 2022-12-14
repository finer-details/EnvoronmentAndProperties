//
//  MainTabView.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 19/09/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var user = User()
    
    @StateObject var peopleViewModel = PeopleViewModel()
    @StateObject var personDataViewModel = PersonDataViewModel()

    @State var selectedTag = 1
    
    var body: some View {
        
        TabView(selection: $selectedTag) {

            PassBasicDataView(user: user)
                .tabItem {
                    VStack {
                        Text("Basic")
                        Image(systemName: "text.book.closed.fill")
                    }
                }.tag(1)
                .environmentObject(user)

            PeopleDetailsView()
                .tabItem {
                    VStack {
                        Text("Read json")
                        Image(systemName: "books.vertical.fill")
                    }
                }.tag(2)
                .environmentObject(peopleViewModel)
                .environmentObject(personDataViewModel)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        
        let peopleViewModel = PeopleViewModel()
        MainTabView(peopleViewModel: peopleViewModel)
    }
}
