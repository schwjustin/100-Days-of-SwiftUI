import UIKit

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

func travelAgain(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travelAgain { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

travelAgain { place -> String in
    return "I'm going to \(place) in my car"
}

travelAgain { place in
    return "I'm going to \(place) in my car"
}

travelAgain { place in
    "I'm going to \(place) in my car"
}

travelAgain {
    "I'm going to \($0) in my car"
}

func newTravel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

newTravel {
    "I'm going to \($0) at \($1) miles per hour."
}

func newNewTravel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = newNewTravel()
result("London")
let result2 = newNewTravel()("London") //not recommended

func travelCounter() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result3 = newNewTravel()
result3("London")
result3("London")
result3("London")

func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}

func runKidsParty(activities: ([String]) -> Void) {
    let kids = ["Bella", "India", "Phoebe"]
    activities(kids)
}
runKidsParty { (names: [String]) in
    for name in names {
        print("Here's your party bag, \(name).")
    }
}

func playSong(_ name: String, notes: () -> String) {
    print("I'm going to play \(name).")
    let playedNotes = notes()
    print(playedNotes)
}
playSong("Mary Had a Little Lamb") {
    return "EDCDEEEDDDEGG"
}

func loadData(input: () -> String) {
    print("Loading...")
    let str = input()
    print("Loaded: \(str)")
}
loadData {
    return "He thrusts his fists against the posts"
}

func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}

func encrypt(password: String, using algorithm: (String) -> String) {
    print("Encrypting password...")
    let result = algorithm(password)
    print("The result is \(result)")
}
encrypt(password: "t4ylor") { (password: String) in
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}

func goShopping(for item: String, decisionHandler: (String) -> Bool) {
    print("I'm going to buy \(item)")
    if decisionHandler(item) == true {
        print("Great! I bought them.")
    } else {
        print("Maybe next time...")
    }
}
goShopping(for: "shoes") { item in
    if item == "shoes" {
        return false
    } else {
        return true
    }
}


