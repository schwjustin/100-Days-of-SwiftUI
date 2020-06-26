//
//  DetailView.swift
//  Challenge 05 - UsersAndFriends
//
//  Created by Justin Schwartz on 6/25/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let result: Result
    
    var body: some View {
        VStack {
            Text(result.name)
            
            .navigationBarTitle("text", displayMode: .inline)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static let results = [Result]()

    static var previews: some View {
        DetailView(result: results[0])
    }
}
