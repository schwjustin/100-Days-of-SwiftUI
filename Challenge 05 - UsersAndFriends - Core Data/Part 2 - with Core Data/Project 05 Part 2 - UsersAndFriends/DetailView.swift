//
//  DetailView.swift
//  Project 05 Part 2 - UsersAndFriends
//
//  Created by Justin Schwartz on 6/27/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let result: Result
    let results: [Result]
    
    var body: some View {
        ZStack {
            Color.init(hue: 250/360, saturation: 80/100, brightness: 5/100).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(result.friends, id: \.id) { item in
                        NavigationLink(destination: DetailView(result: self.friend(item.id), results: self.results)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                    
                                    Text(self.friend(item.id).company)
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                VStack {
                                Image(systemName: "arrow.right.circle.fill")
                                    .font(.headline)
                                    .foregroundColor(self.friend(item.id).isActive ? .green : .red)
                                }
                            }
                            .contentShape(Rectangle())
                            .padding(16)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.init(hue: 250/360, saturation: 40/100, brightness: 15/100))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 0)
                        .padding(.bottom, 16)
                        .padding([.horizontal], 16)
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .accentColor(Color.init(hue: 250/360, saturation: 80/100, brightness: 100/100))
    }
    
    func friend(_ id: UUID) -> Result {
        return self.results.first(where: { $0.id == id}) ?? self.results[0]
    }
}

struct DetailView_Previews: PreviewProvider {
    static let results = [Result]()

    static var previews: some View {
        DetailView(result: results[0], results: results)
    }
}
