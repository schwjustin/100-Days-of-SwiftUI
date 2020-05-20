import SwiftUI

struct NumbersView: View {
    var numbers: String {
        didSet {
            print(numbers)
        }
    }
    var numbersArray: [Character] {
        get {
            return Array(numbers)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(numbersArray, id: \.self) { number in
                Image("hud_\(number)")
                    .renderingMode(.original)
                    .resizable()
                    .frame(maxWidth: 20.0, maxHeight: 26.0)
            }
        }
    }
}
