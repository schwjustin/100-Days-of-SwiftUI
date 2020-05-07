//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Justin Schwartz on 5/7/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var appMove = Int.random(in: 0...2)
    @State private var playerMove = 1
    @State private var appWin = Bool.random()
    @State private var playerWin = false
    @State private var score = 0
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    var appOutcome: String {
        if appWin == true {
            return "Win"
        } else {
            return "Lose"
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Score")) {
                Text("\(score)")
            }
            
            Section(header: Text("Move")) {
                Text("\(moves[appMove])")
            }
            
            Section(header: Text("Outcome")) {
                Text(appOutcome)
            }
            
            Section {
                Picker("Input Unit", selection: $playerMove) {
                    ForEach(0 ..< moves.count) {
                        Text("\(self.moves[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: {
                self.buttonTapped()
            }) {
                Text("Submit")
            }
        }
    }
    
    func buttonTapped() {
        if appWin == true {
            switch appMove {
            case 0:
                if playerMove == 2 {
                    win()
                    break
                } else {
                    lose()
                    break
                }
            case 1:
                if playerMove == 0 {
                    win()
                    break
                } else {
                    lose()
                    break
                }
            case 2:
                if playerMove == 1 {
                    win()
                    break
                } else {
                    lose()
                    break
                }
            default:
                lose()
                break
            }
        } else {
            switch appMove {
            case 0:
                if playerMove == 1 {
                    win()
                    break
                } else {
                    lose()
                    break
                }
            case 1:
                if playerMove == 2 {
                    win()
                    break
                } else {
                    lose()
                    break
                }
            case 2:
                if playerMove == 0 {
                    win()
                    break
                } else {
                    lose()
                    break
                }
            default:
                lose()
                break
            }
        }
    }
    
    func win() {
        score += 100
        appMove = Int.random(in: 0...2)
        appWin = Bool.random()
    }
    
    func lose() {
        if score >= 100 {
            score -= 100
        }
        appMove = Int.random(in: 0...2)
        appWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
