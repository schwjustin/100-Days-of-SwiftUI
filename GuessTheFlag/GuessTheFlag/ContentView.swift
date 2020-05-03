//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Justin Schwartz on 5/3/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button was tapepd")
        }) {
            HStack(spacing: 10) {
                Image(systemName: "pencil")
                Text("Edit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
