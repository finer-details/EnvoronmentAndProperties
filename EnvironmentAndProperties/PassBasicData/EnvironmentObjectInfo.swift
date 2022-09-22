//
//  EnvironmentObjectInfo.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI

struct EnvironmentObjectInfo: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("About @EnvironmentObject")
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .padding()
            
            ScrollView {
                Text("""
    **What is @EnvironmentObject?**
    
    You’ve seen how @State declares simple properties for a type that automatically cause a refresh of the view when it changes, and how **@ObservedObject** declares a property for an external type that may or may not cause a refresh of the view when it changes. Both of these two must be set by your view, but **@ObservedObject** might be shared with other views.
    
    There’s another type of property wrapper available to use, which is **@EnvironmentObject**. This is a value that is made available to your views through the application itself – it’s shared data that every view can read if they want to. So, if your app had some important model data that all views needed to read, you could either hand it from view to view to view or just put it into the environment where every view has instant access to it.
    
    Think of **@EnvironmentObject** as a massive convenience for times when you need to pass lots of data around your app. Because all views point to the same model, if one view changes the model all views immediately update – there’s no risk of getting different parts of your app out of sync.
    """)
                .font(.body)
                .foregroundColor(.black)
            }.padding()
        }.navigationBarTitle(Text(""), displayMode: .inline)
            .background(Color("ReadingBrown"))
    }
}

struct EnvironmentObjectInfo_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectInfo()
    }
}
