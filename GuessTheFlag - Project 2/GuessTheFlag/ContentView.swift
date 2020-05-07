//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Justin Schwartz on 5/3/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct Flag: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: .init(hue: 0, saturation: 0, brightness: 0, opacity: 0.15), radius: 20, y: 10)
    }
}

extension View {
    func FlagImage() -> some View {
        self.modifier(Flag())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selected = 0
    
    @State private var showingScore = false
    @State private var showingWrong = false
    @State private var score = 0
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .font(.body)
                        .foregroundColor(.init(hue: 0, saturation: 0, brightness: 0.4))
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.selected = number
                        self.flagTapped(number)
                        
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .FlagImage()
                    }
                }
                
                Text("\(score)")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
            
        .alert(isPresented: $showingScore) {
            if showingWrong == true {
                return Alert(title: Text("Incorrect"), message:
                    Text("Your score is \(score)\nThat's the flag of \(countries[selected])"),
                    dismissButton:
                    .default(Text("Continue")) {
                        self.askQuestion()
                    })
            } else {
                return Alert(title: Text("Correct"), message:
                    Text("Your score is \(score)"),
                    dismissButton:
                    .default(Text("Continue")) {
                        self.askQuestion()
                    })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 100
            showingWrong = false
        } else {
            showingWrong = true
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
