//
//  AstronautView.swift
//  Project 8 - Moonshot
//
//  Created by Justin Schwartz on 5/25/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var flewMissions = [Mission]()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.flewMissions) { mission in
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .frame(width: 44, height: 44)
                            
                            VStack(alignment: .leading) {
                                Text(mission.displayName)
                                    .font(.headline)
                                
                                Text(mission.formattedLaunchDate)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 16)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id}) {
                matches.append(mission)
            }
        }
        
        self.flewMissions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
