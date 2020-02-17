import Foundation

struct Mode {
    enum GameMode: Int {
        case fiveCardStud = 5
        case sevenCardStud = 7
    }
    
    enum PlayerMode: Int {
        case one = 1, two, three, four
    }
}
