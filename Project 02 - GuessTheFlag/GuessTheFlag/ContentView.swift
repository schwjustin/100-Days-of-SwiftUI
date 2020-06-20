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

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selected = 0
    
    @State private var showingScore = false
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var flagAngle = [0.0, 0.0, 0.0]
    @State private var flagOpacity = [1.0, 1.0, 1.0]
    @State private var flagShake = [0, 0, 0]

        
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
                    .rotation3DEffect(.degrees(self.flagAngle[number]), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.flagOpacity[number])
                    .modifier(Shake(animatableData: CGFloat(self.flagShake[number])))
                }
                
                Text("\(score)")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
            
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle),
                  message: Text(scoreMessage),
                  dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
        }
    }
        
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 100
            scoreTitle = "Correct!"
            scoreMessage = "Your score is \(score)"
            
            correctAnimation()
        } else {
            scoreTitle = "Wrong!"
            scoreMessage = "That's the flag of \(countries[number])"
            
            wrongAnimation()
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        flagAngle = [0.0, 0.0, 0.0]
        withAnimation {
            flagOpacity = [1.0, 1.0, 1.0]
        }
        flagShake = [0, 0, 0]
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
    }
    
    func correctAnimation() {
        for flag in 0...2 {
            if flag == correctAnswer {
                withAnimation {
                    flagAngle[flag] = 360.0
                }
                
            } else {
                withAnimation {
                    flagOpacity[flag] = 0.25
                }
            }
        }
    }
    
    func wrongAnimation() {
        for flag in 0...2 {
            if flag != correctAnswer && flag == selected {
                withAnimation {
                    flagShake[flag] = 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
