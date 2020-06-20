//
//  EditView.swift
//  Challenge 4 - HabitTracker
//
//  Created by Justin Schwartz on 6/20/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var activities: Activities
    @State var activity: ActivityItem
        
    
    var body: some View {
        Form {
       
            Text(activity.name)

            Stepper(
                onIncrement: {
                    self.activity.amount += 1
                    self.saveHabit()
                }, onDecrement: {
                    self.activity.amount -= 1
                    self.saveHabit()
                },
                label: { Text("Completed \(activity.amount) times") }
                )}
            
        .navigationBarTitle("Edit Activity", displayMode: .inline)
    }
    
    func saveHabit() {
        guard let index = activities.items.firstIndex(where: {$0.id == activity.id }) else { return }
        activities.items[index].amount = activity.amount
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(activities: Activities(), activity: ActivityItem(name: "", amount: 0))
    }
}
