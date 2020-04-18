import UIKit

let driving = {
    print("I'm driving in my car")
}

driving()

let drivingWithParameter = { (place: String) in
    print("I'm going to \(place) in my car")
}

drivingWithParameter("London")

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

travel() {
    print("I'm driving in my car")
}

travel { //trailing closure syntax
    print("I'm driving in my car")
}

func travelithParameter(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travelithParameter { (place: String) in
    print("I'm going to \(place) in my car")
}

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

travel { //shorthand
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

func travelAgain() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travelAgain()
result("London")

let result2 = travelAgain()("London") //possible, but not recommended


func travelAgainAgain() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
let result3 = travelAgainAgain()
result("London")
result("London")
result("London")
result("London")

