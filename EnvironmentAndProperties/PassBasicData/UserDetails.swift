//
//  UserDetails.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI

struct UserDetails: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        ZStack {
            (Color("VeryLightGray"))
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack {
                        Text("""
        Information in this page is being passed from the previous View whereby user data is entered and passed via **@StateObject** from the ***MainTabView*** loading file where the object is first created.
        The remaining data is collected by using **`@EnvironmentObject var user: User`** and accessing the items by using:
        ***`user.username`
        `user.password`
        `user.emailAddress`***
        """)
                        .padding()
                        .padding(.top, 30)
                        Divider()
                            .padding()
                        Text("Name:")
                        Text(user.username)
                            .modifier(TextFieldModifier())
                        Text("Password")
                        Text(user.password)
                            .modifier(TextFieldModifier())
                        Text("Email Address:")
                        Text(user.emailAddress)
                            .modifier(TextFieldModifier())
                        Spacer()
                    }
                    Divider()
                    
                    Text(
"""
You need to store your variable properties in a
***class*** and use the **ObservableObject** protocol.
Then use **@Published** on each property to tell them to monitor for changes.
""").padding()
                    Text(
"""
`class User: ObservableObject {`
`@Published var username = ""`
`@Published var password = ""`
`@Published var emailAddress = ""`
`}`
""").font(.system(size:12))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1.0))
                        .padding(.bottom, 10)
                }
                Spacer()
            }.navigationBarTitle("User details appear here", displayMode: .inline)
        }
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            UserDetails()
                .environmentObject(User())
        }
    }
}

