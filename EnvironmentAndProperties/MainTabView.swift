//
//  MainTabView.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 19/09/2022.
//

import SwiftUI

struct MainTabView: View {
    
//    @EnvironmentObject var user: User
    @StateObject var user = User()
//    var person = Person(firstName: "test", lastName: "Test", age: 111, hasDrivingLicense: false, hobbies: [.init(name: "Walking")])
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

            PassArrayData()
                .tabItem {
                    VStack {
                        Text("Array")
                        Image(systemName: "books.vertical.fill")
                    }
                }.tag(2)
            
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
