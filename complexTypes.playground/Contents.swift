import UIKit

let john = "john lennon"
let paul = "paul mccartney"
let george = "george harrison"
let ringo = "ringo starr"

let beatles = [john, paul, george, ringo] //array
beatles[1] //paul

let colors = Set(["red", "green", "blue"]) //set - random order
let colors2 = Set(["red", "green", "blue", "red"]) //duplicates are ignored

var name = (first: "taylor", last: "swift") //tuple: 1. can't add or remove 2. can't change type 3. can access using numerical positions or names
name.0
name.first

let address = (house: 555, street: "taylor swift avenue", city: "nashville") //tuple
let set = Set(["aardvark", "astronaut", "azalea"]) //set
let pythons = ["eric", "graham", "john", "terry", "terry"] //array

let heights = [ //dictionary *similar to map class in c++
    "taylor swift": 1.78, //key: value
    "ed sheeran": 1.73,
]
heights["taylor swift"]

let favIceCream = [
    "paul": "chocolate",
    "sophie": "vanilla"
]
favIceCream["paul"]
favIceCream["charlotte", default: "unknown"] //if the key "charlotte" doesn't exist, returns the default value "unknown"

//arrays, sets, and dictionaries are collections
var teams = [String: String]() //empty array of Strings
teams["paul"] = "red"

var results = [Int]() //empty array of Ints

var words = Set<String>() //empty set of Strings
var numbers = Set<Int>() //empty set of Ints

var scores = Dictionary<String, Int>() //empty dictionary

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result { //enums
    case success
    case failure
}

let result4 = Result.failure

enum Activity {
    case bored
    case running(destination: String) //enum associaited values
    case talking(topic: String)
}

let talking = Activity.talking(topic: "football") //football is the associated value

enum Planet: Int {
    case mercury //0
    case venus //1
    case earth //2
    case mars //3
}

let earth = Planet(rawValue: 2)

enum naturalPlanet: Int {
    case mercury = 1
    case venus //2
    case earth //3
    case mars //4
}

let naturalEarth = naturalPlanet(rawValue: 3)
