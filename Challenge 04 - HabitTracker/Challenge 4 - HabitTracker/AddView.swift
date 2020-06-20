//
//  AddView.swift
//  Challenge 4 - HabitTracker
//
//  Created by Justin Schwartz on 6/20/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var name = ""
    @State private var amount = ""
    @State private var showingAlert = false

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                    let item = ActivityItem(name: self.name, amount: 0)
                    self.activities.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
