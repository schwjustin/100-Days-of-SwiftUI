import UIKit

var playWithDog = {
    print("Fetch!")
}
func play(using playType: () -> Void) -> String {
    print("Let's play a game")
    playType()
    return ""
}
play(using: playWithDog)
