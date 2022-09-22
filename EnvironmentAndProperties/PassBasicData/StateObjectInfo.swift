//
//  StateObjectInfo.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI

struct StateObjectInfo: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Text("About @StateObject")
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .padding()
            
            ScrollView {
                Text("""
    "**What is @StateObject?**
    
    Somewhere between **@State** and **@ObservedObject** lies **@StateObject**. This is a specialized version of @ObservedObject, and it works in almost exactly the same way: you must conform to the **ObservableObject protocol**, you can use **@Published** to mark properties as causing change notifications, and any views that watch an **@StateObject** will refresh their body when the object changes.
    
    There is one important difference between **@StateObject** and **@ObservedObject**, which is ownership – which view created the object, and which view is just watching it.
    
    ***The rule is this:***
    Whichever view is the **first to create your object must use @StateObject**, to tell SwiftUI it is the owner of the data and is responsible for keeping it alive. **All other views must use @ObservedObject**, to tell SwiftUI they want to **watch** the object for changes but don’t own it directly.
    """)
                .font(.body)
                .foregroundColor(.black)
            }.padding()
        }.navigationBarTitle(Text(""), displayMode: .inline)
            .background(Color("ReadingBrown"))
    }
}



struct StateObjectInfo_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectInfo()
    }
}
