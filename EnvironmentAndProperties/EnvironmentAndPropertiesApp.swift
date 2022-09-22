//
//  EnvironmentAndPropertiesApp.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI

@main
struct EnvironmentAndPropertiesApp: App {
    
//    @StateObject var user = User()
    @StateObject var peopleViewModel = PeopleViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView(selectedTag: 1)
//                .environmentObject(user)
                .environmentObject(peopleViewModel)
        }
    }
}
