//
//  ContentView.swift
//  Project 05 Part 2 - UsersAndFriends
//
//  Created by Justin Schwartz on 6/27/20.
//  Copyright © 2020 Justin Schwartz. All rights reserved.
//

import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

    let standard = UINavigationBarAppearance()
        standard.configureWithTransparentBackground()
        standard.backgroundColor = .init(hue: 250/360, saturation: 80/100, brightness: 5/100, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]

        standard.titleTextAttributes = textAttributes
        standard.largeTitleTextAttributes = textAttributes
    
    navigationBar.standardAppearance = standard
    navigationBar.compactAppearance = standard
    navigationBar.scrollEdgeAppearance = standard
 }
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CDResult.entity(), sortDescriptors: []) var cdresults: FetchedResults<CDResult>
    @State private var results = [Result]()
    
    var body: some View {
       
        NavigationView {
            ZStack {
                Color.init(hue: 250/360, saturation: 80/100, brightness: 5/100).edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(cdresults, id: \.wrappedId) { item in
                            VStack {
                            //NavigationLink(destination: DetailView(result: item, results: self.results)) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.wrappedName)
                                            .font(.headline)
                                            .foregroundColor(Color.white)
                                        
                                        Text(item.wrappedCompany)
                                            .foregroundColor(Color.gray)
                                    }
                                    Spacer()
                                    VStack {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(item.isActive ? .green : .red)
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.init(hue: 250/360, saturation: 80/100, brightness: 5/100))
                    .edgesIgnoringSafeArea(.all)
                }
            }
            .navigationBarTitle("UsersAndFriends", displayMode: .inline)
        }
        .onAppear(perform: checkDataLoad)
        .background(Color.init(hue: 250/360, saturation: 80/100, brightness: 5/100))
        .accentColor(Color.init(hue: 250/360, saturation: 80/100, brightness: 100/100))
    }
    
    func checkDataLoad() {
        if cdresults.isEmpty {
            loadData()
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Result].self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse
                        self.saveToCD(users: self.results)
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    func saveToCD(users: [Result]) {
        print(users.count)
        for user in users {
            let person = CDResult(context: self.moc)
            person.id = user.id
            person.name = user.name
            person.isActive = user.isActive
            person.company = user.company

            /*var tempFriendArray = Array<CDFriend>()

            user.friends.forEach { friend in
                let cdFriend = CDFriend(context: moc)
                cdFriend.id = friend.id
                cdFriend.name = friend.name
                tempFriendArray.append(cdFriend)
            }

            person.friends = NSSet(array: tempFriendArray)*/
        }
       // if self.moc.hasChanges {
            try? moc.save()
       // }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
