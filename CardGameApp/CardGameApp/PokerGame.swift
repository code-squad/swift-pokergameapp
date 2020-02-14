import Foundation

class PokerGame {
    var participants = [Participant]()
    var dealer = Dealer()
    var cardsCount: Int
    var participantCount: Int
    
    init(gameMode: Mode.GameMode, playerMode: Mode.PlayerMode) {
        cardsCount = gameMode.rawValue
        participantCount = playerMode.rawValue
        
        for count in 0..<participantCount {
            participants.append(Participant())
            participants[count].role += "#\(count+1)"
        }
    }
    
    func giveCards() {
        for _ in 0..<cardsCount {
            guard let pickedCard = dealer.pickOneCard() else { return }
            dealer.cards.append(pickedCard)
            for participant in participants {
                guard let pickedCard = dealer.pickOneCard() else { return }
                participant.cards.append(pickedCard)
            }
        }
    }
    
    func openCards() {
        print("-------------------- Card Open --------------------")
        for index in 0..<participantCount {
            print("\(participants[index].role) \(participants[index].cards)")
        }
        print("\(dealer.role) \(dealer.cards)\n")
    }
}
