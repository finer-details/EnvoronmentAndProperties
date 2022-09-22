//
//  StateInfo.swift
//  EnvironmentAndProperties
//
//  Created by David Devlin on 16/09/2022.
//

import SwiftUI

struct StateInfo: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("About @State")
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .padding()
            
            ScrollView {
                Text(
    """
    **What is @State?**
    
    State is inevitable in any modern app, but with SwiftUI it’s important to remember that all of our views are simply functions of their state – we don’t change the views directly, but instead manipulate the state and let that dictate the result.
    
    SwiftUI gives us several ways of storing state in our application, but they are subtly different and it’s important to understand how they are different in order to use the framework properly.
    
    The simplest way of working with state is the @State property wrapper, used like this:
    """).padding(.bottom, 10)
                Text("""
    `struct ContentView: View {`
    `@State private var tapCount = `
    
        `var body: some View {`
            `Button("Tap count:  \\(tapCount)") {`
                `tapCount += 1`
            `}`
        `}`
    `}`
    """).font(.system(size:12))
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1.0))
                    .padding(.bottom, 10)
                Text("""
    This creates a property inside a view, but it uses the @State property wrapper to ask SwiftUI to manage the memory. This matters: all our views are structs, which means they can’t be changed, and if we weren’t even able to modify an integer in our apps then there wouldn’t be much we could do.
    
    So, when we say @State to make a property, we hand control over it to SwiftUI so that it remains persistent in memory for as long as the view exists. When that state changes, SwiftUI knows to automatically reload the view with the latest changes so it can reflect its new information.
    
    @State is great for simple properties that belong to a specific view and never get used outside that view, so as a result it’s important to mark those properties as being private to re-enforce the idea that such state is specifically designed never to escape its view.
    
    Information taken from Hacking With Swift:
    https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject#:~:text=Use%20%40StateObject%20once%20for%20each,app%2C%20such%20as%20shared%20data.
    
    """)
                .font(.body)
                .foregroundColor(.black)
            }.padding()
        }.navigationBarTitle(Text(""), displayMode: .inline)
            .background(Color("ReadingBrown"))
    }
}

struct StateInfo_Previews: PreviewProvider {
    static var previews: some View {
        StateInfo()
    }
}
