import UIKit

let firstScore = 12
let secondScore = 4
let total = firstScore + secondScore

let life = 42
let doubleMeaning = 42 + 42

let fakers = "fakers gonna "
let action = fakers + "fake"

let firstHalf = ["john", "paul"]
let secondHalf = ["george", "ringo"]
let beatles = firstHalf + secondHalf

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

let scoreOne = 6
let scoreTwo = 4

scoreOne == scoreTwo //false
"Taylor" <= "Swift" //false

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces A lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

print(firstCard == secondCard ? "Cards are the same" : "Cards are different") //ternary operator

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough //to continue to the next case
default: //required
    print("Enjoy your day!")
}

let examScore = 85

switch examScore {
case 0..<50: //includes 0 through 49
    print("You failed badly.")
case 50...85: //includes 50 through 85
    print("You did OK.")
default:
    print("You did great!")
}
