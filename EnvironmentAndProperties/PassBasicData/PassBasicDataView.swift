//
//  ContentView.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

//import Combine
import SwiftUI

class User: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var emailAddress = ""
}


struct PassBasicDataView: View {
    @ObservedObject var user: User
    
    let gradientDoseView = Gradient(colors: [.white, .white, Color("ReadingBrown").opacity(0.7), .white])
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    Color("BackgroundVLightBrown")
                    VStack {
                        VStack {
                            Text("Enter details into the")
                                .padding(.top, 5)
                            Text("TextFields below")
                            Text("then press ***Next Page >***")
                            NavigationLink("Next Page  >", destination: UserDetails())
                                .font((.title3))
                                .padding(5)
                                .background(Color("LightGray"))
                                .cornerRadius(5)
                                .padding(.top, 5)
                            VStack {
                                Text("Enter your Username:")
                                TextField("username", text: $user.username)
                                    .keyboardType(.alphabet)
                                    .modifier(TextFieldModifier())
                                Text("Enter your Password:")
                                TextField("password", text: $user.password)
                                    .keyboardType(.alphabet)
                                    .modifier(TextFieldModifier())
                                Text("Enter your Email Address:")
                                TextField("email Address", text: $user.emailAddress)
                                    .keyboardType(.emailAddress)
                                    .modifier(TextFieldModifier())
                            }.padding([.top, .leading, .trailing], 10)
                        }.navigationTitle("Handling Data")
                            .background(Color("VeryLightGray"))
                            .shadow(color: .gray, radius: 10, x: 10, y: 10)
                            .cornerRadius(10)
                            .padding(.top, 10)
                        Spacer()
                        VStack(alignment: .leading) {
                            NavigationLink("@State", destination: StateInfo())
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.top, -15)
                            Spacer()
                            NavigationLink("@StateObject", destination: StateObjectInfo())
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            NavigationLink("@ObservedObject", destination: ObservedObjectInfo())
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            NavigationLink("@EnvironmentObject", destination: EnvironmentObjectInfo())
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                        }.padding(.top, 25)
                    }
                }.background(AngularGradient(gradient: gradientDoseView, center: .center, angle: .degrees(120)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PassBasicDataView(user: User())
    }
}
