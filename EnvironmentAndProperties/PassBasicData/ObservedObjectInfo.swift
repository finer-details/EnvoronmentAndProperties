//
//  ObservedObject.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI

struct ObservedObjectInfo: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Text("About @ObservedObject")
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .padding()
            
            ScrollView {
                Text("""
    **What is @ObservedObject?**
    
    For more complex properties – when you have a custom type you want to use that might have multiple properties and methods, or might be shared across multiple views – you will often use **@ObservedObject** instead.
    
    This is very similar to **@State** except now we’re using an external reference type rather than a simple local property like a string or an integer. You’re still saying that your view depends on data that will change, except now it’s data you’re responsible for managing yourself – you need to create an instance of the class, create its own properties, and so on.
    
    Whatever type you use with **@ObservedObject** should conform to the ***ObservableObject protocol***. When you add properties to observable objects you get to decide whether changes to each property should force views that are watching your object to refresh or not. You usually will, but it’s not required.
    
    There are several ways for an observed object to notify views that important data has changed, but the easiest is using the **@Published** property wrapper. You can also use custom publishers from the Combine framework if you need more control, but realistically this will be very rare. If the observable object happens to have several views using its data, either option will automatically notify them all.
    
    ***Warning:*** *When you use a custom publisher to announce that your object has changed, this must happen on the main thread.*
    """)
                .font(.body)
                .foregroundColor(.black)
            }.padding()
        }.navigationBarTitle(Text(""), displayMode: .inline)
            .background(Color("ReadingBrown"))
    }
}



struct ObservedObjectInfo_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectInfo()
    }
}
