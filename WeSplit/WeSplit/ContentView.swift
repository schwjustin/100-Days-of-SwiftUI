//
//  ContentView.swift
//  WeSplit
//
//  Created by Justin Schwartz on 5/2/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0 //optional, so use nil coalescing operator
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Grand Total")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 4 ? .red : .black)
                }
                
                Section(header: Text("Amount Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 4 ? .red : .black)
                }
            }
        .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
