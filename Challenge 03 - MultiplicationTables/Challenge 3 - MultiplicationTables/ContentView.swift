//
//  ContentView.swift
//  Challenge 3 - MultiplicationTables
//
//  Created by Justin Schwartz on 5/19/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct Game: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var showing: Bool
    @Binding var score: Int
    
    @State private var answer = ""
    @State private var current = 0
    @State private var selected = Int.random(in: 0..<12)
    @State private var count = 1

    let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    let questions: Int;
    let level: Int;

    var body: some View {
        Form {
            Section(header: Text("Question".uppercased()).padding(.top)) {
               Text("\(level) * \(numbers[selected])").padding(0)
            }
            
            Section(header: Text("Answer".uppercased())) {
                TextField("Answer", text: $answer)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Submit".uppercased())) {
                Button("Submit") {
                    if self.count == self.questions {
                        self.check()
                        self.showing = true
                    } else if self.answer != "" {
                        self.count += 1
                        self.check()
                        self.question()
                    }
                }
            }
            
            Section(header: Text("Score".uppercased())) {
                    Text("\(score)")
            }
        }
        .alert(isPresented: $showing) {
           Alert(title: Text("Level \(Int(level))"),
           message: Text("Score: \(score)"),
           dismissButton: .default(Text("OK"), action: { self.close() }))
        }
    }
    
    func question() {
        selected = Int.random(in: 0..<12)
        answer = ""
    }

    func check() {
        if Int(answer) == level * numbers[selected] {
            score += 1
        }
    }
    
    func close() {
        self.presentationMode.wrappedValue.dismiss()
        score = 0
    }
}

struct ContentView: View {
    @State private var level = 1.0
    @State private var active = false
    @State private var amount = 1
    @State private var showing = false
    @State private var score = 0
   
    let questionAmount = [5, 10, 20]
    
    var body: some View {
        NavigationView {
             Form {
                Section(header: Text("Level".uppercased())) {
                    Slider(value: $level, in: 1...12, step: 1)
                    Text("Level \(Int(level))")
                }
                
                Section(header: Text("Number of Questions".uppercased())) {
                    Picker("", selection: $amount) {
                        ForEach(0 ..< questionAmount.count) {
                            Text("\(self.questionAmount[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Start Game".uppercased())) {
                    Button("Start") {
                        self.active.toggle()
                    }
                }
             }
            .navigationBarTitle("Multiply")
                    
            .sheet(isPresented: $active) {
                Game(showing: self.$showing, score: self.$score, questions: self.questionAmount[self.amount],  level: Int(self.level))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
