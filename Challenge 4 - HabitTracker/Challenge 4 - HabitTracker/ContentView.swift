//
//  ContentView.swift
//  Challenge 4 - HabitTracker
//
//  Created by Justin Schwartz on 5/31/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section(header: Text("Examples")) {
            Text("Item 1")
            Text("Item 2")
                Text("Item 3")}
        
        
        Section(header: Text("Examples")) {
            Text("Item 1")
            Text("Item 2")
                Text("Item 3")}
    }.listStyle(GroupedListStyle())
       // .environment(\.horizontalSizeClass, .regular)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
