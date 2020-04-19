import UIKit

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

var newNumber = 1

repeat {
    print(newNumber)
    newNumber += 1
} while newNumber <= 20

print("Ready or not, here I come!")

while false {
    print("This is false") //will never execute
}

repeat {
    print("This is false")
} while false

var countDown = 10

while countDown >= 0 {
    print(countDown)
    countDown -= 1
}

print("Blast off!")

while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
